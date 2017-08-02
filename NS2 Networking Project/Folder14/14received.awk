#==================================================================
# NAME      -  JASON SNEDDON
# DATE      -  29 NOVEMBER 2016
# CS 436    -  INTRODUCTION TO NETWORKING
# PROJECT 1 -  NETWORK SIMULATION USING NS2
#
#
# PURPOSE: This is the awk file used to calculate the total number 
#          of packets RECEIVED at blueDest27 at each 0.5 second 
#          time interval. Use the number of packets received (r) 
#          at blueDest27
#
# EXAMPLE: r 2.228824 6 27 exp 1000 ------- 14 14.6 27.0 0 3486
#
# @USAGE: $ awk -f 14received.awk project1out.tr
#==================================================================

BEGIN {
	
	# Initialize variables:

	time1 = 0.0;
	time2 = 0.0;	

	# Number of packets received at node 27
	numPktsReceived = 0;

	# Total packets received.
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

		# Write data to file
		printf("%f \t %f\n", time2, numPktsReceived) > "14received.xls";
		printf("%f \t    ", time2);
		print int( numPktsReceived );

		# Update time1      
		time1 = $2;

		# Update totalPackets received
		totalPktsReceived = totalPktsReceived + numPktsReceived;

		# Reset the number of packets received
		numPktsReceived = 0;

	}

	# Filter for data sent from server14 to blueDest27
	# The 2nd to last node is router6 and the flowID is 14
	# r 2.228824 6 27 exp 1000 ------- 14 14.6 27.0 0 3486
	if ( $1 == "r" && $3 == 6 && $4 == 27 && $5 == "exp" && $8 == 14 ) {
		numPktsReceived++;

	}

}

END {

printf("--------------------------------\n");
printf("Total number\nof packets\nreceived at   = %d packets\ndestination\nnode 27\n\n", totalPktsReceived);
printf("\n===========================================\n\n");

}



#==============================     END FILE     ==============================

