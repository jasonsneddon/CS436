#==================================================================
# NAME      -  JASON SNEDDON
# DATE      -  29 NOVEMBER 2016
# CS 436    -  INTRODUCTION TO NETWORKING
# PROJECT 1 -  NETWORK SIMULATION USING NS2
#
#
# PURPOSE: This is the awk file used to calculate the total number 
#		     of packets DROPPED at ANY HOP along the source to 
# 			  destination path at each 0.5 second time interval. 
# 			  Use the number of packets dropped (d) at any hop.
#
# EXAMPLE:
#		   + 2.162824 14 0 exp 1000 ------- 14 14.6 27.0 35 3984
#		   d 2.162824 14 0 exp 1000 ------- 14 14.6 27.0 35 3984
#
# @USAGE: $ awk -f 14dropped.awk project1out.tr
#==================================================================

BEGIN {

	# Initialize variables:

	time1 = 0.0;
	time2 = 0.0;	

	# Number of packets dropped.
	numPktsDropped = 0;

	# Total packets dropped
	totalPkts = 0;


	printf("\n\n~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ REPORT ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n\n");
	printf(" Time\t       Packets Dropped\n");
}

# BODY 
{
	time2 = $2;

	# Go for every 0.5 second interval
	if ( time2 - time1 > 0.5) {	

		printf("%f \t %f\n", time2, numPktsDropped) > "14dropped.xls";
		printf("%f \t %f\n", time2, numPktsDropped);
		
		# Update time1
		time1 = $2;
		
		# Update total packets dropped
		totalPkts = totalPkts + numPktsDropped;

		# Reset the number of packets dropped for new interval
		numPktsDropped = 0;

	}
	
	# Filter for packets dropped
	if ( $1 == "d" && $5 == "exp" && $8 == 14 ) {
		numPktsDropped++;
	}

}

END {
	printf("\n\n~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ SUMMARY ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n");
	printf("\nTotal number of packets dropped at any hop from server 14\n"); 
	printf("to node 27 = \n\n%d packets\n", totalPkts);
	print("\n=============================================================\n\n");
}



#=====================     END FILE     ===========================
