#==================================================================
# NAME      -  JASON SNEDDON
# DATE      -  29 NOVEMBER 2016
# CS 436    -  INTRODUCTION TO NETWORKING
# PROJECT 1 -  NETWORK SIMULATION USING NS2
#
#
# PURPOSE: This is the awk file used to calculate JITTER for each
# 		   individual packet received at blueDest27 from server 14

# CALCULATION:
# jitter ＝((recvtime(j)-sendtime(j))-(recvtime(i)-sendtime(i)))/(j-i), j > i 
#
# @USAGE: awk -f 14jitter.awk project1out.tr
#==================================================================

BEGIN {
     
	# Initialization
	highest_packet_id = 0;

	printf("\n\n~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ REPORT ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n\n");
	printf("Start Time\t\t Jitter\n");
	printf("-----------\t      ------------\n");
}

# 	BODY
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

	if ( packet_id > highest_packet_id ) {

	highest_packet_id = packet_id;

	}

	#Record the transmission time
	if ( start_time[packet_id] == 0 ) {
	
	# Record the sequence number
	pkt_seqno[packet_id] = seq_no;
	start_time[packet_id] = time;

	}

	#Record the receiving time for EXP (flowID = 14)
	if ( flow_id == 14 && action != "d" ) {

	if ( action == "r" ) {
               
		end_time[packet_id] = time;
   
	}
     
	} else {
          
		end_time[packet_id] = -1;
     
	}

}

END {
     
	last_seqno = 0;
	     
	last_delay = 0;     
	seqno_diff = 0;
     
	for ( packet_id = 0; packet_id <= highest_packet_id; packet_id++ ) {
          
		start = start_time[packet_id];
		end = end_time[packet_id]; 

		# Calculate packet delay         
		packet_duration = end - start;
          
		if ( start < end )          
		{
               
			seqno_diff = pkt_seqno[packet_id] - last_seqno;               
			delay_diff = packet_duration - last_delay;
               
			if ( seqno_diff == 0 ) {
                    
				jitter = 0;
               
			} else {
           
			# Calculate jitter         
			jitter = delay_diff/seqno_diff;
               
			}
         
			# Write to file      
			printf("%f \t %f\n", start, jitter) > "14jitter.xls";               

			# Output to terminal
			printf("%f \t\t%f\n", start, jitter);

			last_seqno = pkt_seqno[packet_id];               
			last_delay = packet_duration;
          
		}     
	}

	printf("\n==========================================\n");
	printf("\t     END RESULTS");
	printf("\n==========================================\n\n");

}


#==========================     END FILE     ==============================
