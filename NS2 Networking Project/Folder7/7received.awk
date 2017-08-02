#==================================================================
# NAME      -  JASON SNEDDON
# DATE      -  29 NOVEMBER 2016
# CS 436    -  INTRODUCTION TO NETWORKING
# PROJECT 1 -  NETWORK SIMULATION USING NS2
#
#
# PURPOSE: This is the awk file used to calculate the total number 
#		   of packets RECEIVED at redDest19 at each 0.5 second 
#          time interval. Use the number of packets received (r) 
#			  at redDest19
#
# @USAGE: $ awk -f 7received.awk project1out.tr
#==================================================================

BEGIN {
	
	time1 = 0.0;
	time2 = 0.0;
	
	# Number of packets received at node 19 in time interval
	numPacketsReceived = 0;	

	# Total packets received in total simulation time
	totalPktsReceived = 0;

	printf("\n\n~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ REPORT ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n\n");
	printf(" Time\t      Packets Received\n");

}

# BODY
{

	# Get time
	time2 = $2

	# Go for every 0.5 second interval
	if (time2 - time1 > 0.5) {

	printf("%f \t %f\n", time2, numPacketsReceived) > "7received.xls";

	# Output interval results to terminal
	printf("%f \t    ", time2);
	print int( numPacketsReceived );

	# Update time1      
	time1 = $2;

	# Update totalPackets received
	totalPktsReceived = totalPktsReceived + numPacketsReceived;

	# Reset the number of packets
	numPacketsReceived = 0;

	}

	# Filter data for packets that were received by node 19 from router4
	# using flowid = 7
	if ($1 == "r" && $3 == 4 && $4 == 19 && $5 == "cbr" && $8 == 7) {

		numPacketsReceived++;

	}

}

END {

printf("--------------------------------\n");
printf("Total number\nof packets\nreceived at   = %d packets\ndestination\nnode 19\n\n", totalPktsReceived);
printf("\n===========================================\n\n");

}






#=====================     END FILE     ===========================
