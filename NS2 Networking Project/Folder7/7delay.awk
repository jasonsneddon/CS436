#==================================================================
# NAME      -  JASON SNEDDON
# DATE      -  29 NOVEMBER 2016
# CS 436    -  INTRODUCTION TO NETWORKING
# PROJECT 1 -  NETWORK SIMULATION USING NS2
#
#
# PURPOSE: This is the awk file used to calculate the total delay 
#          for each individual packet received at redDest19 from 
#          server 7 
#
# @USAGE: awk -f 7delay.awk project1out.tr
#==================================================================
BEGIN {
	
	# Initialize highest packet id. The highest packet id is the 
	# last packet sent
	highest_packet_id = 0;

	printf("\n\n~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ REPORT ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n\n");
	printf("Start Time\t\tTotal Delay\n");
	printf("-----------\t\t------------\n");
}

# BODY
{

	action = $1;
	time = $2;
	from = $3;
	to = $4;
	type = $5;
	pktsize = $6;
	flow_id = $8;
	src = $9;
	dst = $10;
	seq_no = $11;
	packet_id = $12;

	# Update highest packet id
	if ( packet_id > highest_packet_id ) {
		highest_packet_id = packet_id;
	}

	if ( start_time[packet_id] == 0 ) {
	  	start_time[packet_id] = time;
	}
	
	# Filter data for server7 with flowID = 7 
	# destination node = 19 and if the packet was NOT dropped
	if ( flow_id == 7 && action != "d" ) {
		
		# Packet was received
		if ( action == "r" ) {
			end_time[packet_id] = time;
		}

	} else {
		end_time[packet_id] = -1;
   
	}
}

END {
	
	# Start at the first packet id sent and go to the highest packet id 
	for(packet_id = 0; packet_id <= highest_packet_id; packet_id++) {
		start = start_time[packet_id];
	   end = end_time[packet_id];
	   packet_duration = end - start;

	   if ( start < end ) {
	
			# Write to file
			printf("%f \t %f\n", start, packet_duration) > "7delay.xls";
	
			# Output to terminal
			printf(" %f \t\t  %f\n", start, packet_duration);

   	}
	}

	printf("\n==========================================\n");
	printf("\t     END RESULTS");
	printf("\n==========================================\n\n");
}



#=====================     END FILE     ===========================
