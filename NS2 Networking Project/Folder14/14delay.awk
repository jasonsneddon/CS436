#==================================================================
# NAME      -  JASON SNEDDON
# DATE      -  29 NOVEMBER 2016
# CS 436    -  INTRODUCTION TO NETWORKING
# PROJECT 1 -  NETWORK SIMULATION USING NS2
#
#
# This is the awk file used to calculate the total delay for each
# individual packet received at blueDest27 from server 14 
#		- CBR over UDP and LossMonitor for $blueDest27
#	
# $5 = type = exp
# $8 = flowID = 14
# $9 = source = 14.6
# $10 = destination = 27.0
#
# @USAGE: awk -f 14delay.awk project1out.tr
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

	# Set the start time for the packet
	if ( start_time[packet_id] == 0 ) {
	  	start_time[packet_id] = time;
	}
		
	# Filter data for server14 with flowID = 14 
	# destination node = 27 and if the packet was NOT dropped
	if ( flow_id == 14 && action != "d" ) {
			
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

		# Calculate the delay
   	packet_duration = end - start;

		# Write to file
   	if ( start < end ) {
			printf("%f \t %f\n", start, packet_duration) > "14delay.xls";
			
			# Output to terminal
			printf(" %f \t\t  %f\n", start, packet_duration);
   	
		}
	}

	printf("\n==========================================\n");
	printf("\t     END RESULTS");
	printf("\n==========================================\n\n");
}





#=====================     END FILE     ===========================
