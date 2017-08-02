#==================================================================
# NAME      -  JASON SNEDDON
# DATE      -  29 NOVEMBER 2016
# CS 436    -  INTRODUCTION TO NETWORKING
# PROJECT 1 -  NETWORK SIMULATION USING NS2
#
#
# PURPOSE: This is the awk file used to calculate the total number
#          of packets SENT from server14 at each 0.5 second time
#          interval. Use the number of packets received (r) at 
# 		     the 2nd hop on the source to destination path that 
#		     belongs to the same flowID (14). The 2nd hop is 1.
#
# EXAMPLE: r 2.145824 0 1 exp 1000 ------- 14 14.6 27.0 3 3517
#
# @USAGE: $ awk -f 14sent.awk project1out.tr
#==================================================================


BEGIN {

	# Initialize variables
   time1 = 0.0;
   time2 = 0.0;

	numPktsSent = 0;
	totalPktsSent = 0;

	numPktsRouter = 0;
	totalRouter = 0;

	printf("\n\n~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ REPORT ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n\n");
	printf(" Time\t      Packets Sent\n");
}

# BODY
{
   time2 = $2;

   if (time2 - time1 > 0.5) {

      printf("%f \t %f\n", time2, numPktsSent) > "14sent.xls";

		# Output interval results to terminal
		printf("%f \t    ", time2);
		print int( numPktsSent );

		# Update time1      
		time1 = $2;

		# Update totalPackets sent
		totalPktsSent = totalPktsSent + numPktsSent;
		totalRouter = totalRouter + numPktsRouter;

		# Reset the number of packets
		numPktsSent = 0;
		numPktsRouter = 0;
   }

	# Filter for packets sent
	# r 2.145824 0 1 exp 1000 ------- 14 14.6 27.0 3 3517
   if ( $1 == "r" && $3 == 0 && $4 == 1 && $5 "exp" && $8 == 14 ) {
      numPktsSent++;
   }

	# Filter for packets sent from server14 to router1
	   if ( $1 == "+" && $3 == 14 && $4 == 0 && $5 "exp" && $8 == 14 ) {
      numPktsRouter++;
   }

}

END {

printf("------------------------------\n");
printf("Total =\t\t    %d", totalPktsSent);

printf("\n\n~ ~ ~ ~ ~ ~ ~ ~ ~ ~ SUMMARY ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n");
printf("Total number of packets sent from server 14\n");
printf("to the destination 27 using the number of \n");
printf("packets received (r) at the 2nd hop = \n\n\t\t%d", totalPktsSent);
printf("\n===========================================\n\n");


printf("Total number of packets sent from server 14\n");
printf("to the destination 27 using the number of \n");
printf("packets enqueue (+) at the router = \n\n\t\t%d", totalRouter);
printf("\n===========================================\n\n");

}



#=====================     END FILE     ===========================
