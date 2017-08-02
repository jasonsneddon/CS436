#==================================================================
# NAME      -  JASON SNEDDON
# DATE      -  29 NOVEMBER 2016
# CS 436    -  INTRODUCTION TO NETWORKING
# PROJECT 1 -  NETWORK SIMULATION USING NS2
#
#
# PURPOSE: This is the awk file used to calculate the total number 
#          of packets DROPPED at ANY HOP along the source to 
#          destination path at each 0.5 second time interval. Use 
#		     the number of packets dropped (d) at any hop.
#
#
# @USAGE: $ awk -f 7dropped.awk project1out.tr
#==================================================================

BEGIN {

	# Initialize variables:
	time1 = 0.0;
	time2 = 0.0;
	numPktsDropped = 0;
	totalPkts = 0;

	printf("\n\n~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ REPORT ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n\n");
	printf(" Time\t\tPackets Dropped\n");
	printf("-----------\t---------------\n");
}


# BODY 
{

	time2 = $2;

	# Go for every 0.5 second interval
	if ( time2 - time1 > 0.5) {

		# Write to file
		printf("%f \t %f\n", time2, numPktsDropped) > "7dropped.xls";
		
		# Output to terminal
		printf("%f \t     ", time2);
		print int( numPktsDropped );
		
		# Update time1
		time1 = $2;
		
		# Update total packets dropped
		totalPkts = totalPkts + numPktsDropped;
		
		# Reset the number of packets dropped
		numPktsDropped = 0;
	}
	
	
	# Filter for dropped packets along any hop using flow id = 7
	if($1 == "d" && $5 == "cbr" && $8 == 7 )  {
		# Increment number of packets dropped
		numPktsDropped++;
	}

}

END {
	printf("--------------------------------\n");
	printf("Total number\nof packets\ndropped at   =   %d packets\nany hop\nfrom\nserver 7\n\n", totalPkts);

	printf("\n==========================================\n");
	printf("\t     END RESULTS");
	printf("\n==========================================\n\n");
}



#=====================     END FILE     ===========================
