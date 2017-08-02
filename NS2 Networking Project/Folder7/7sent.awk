#==================================================================
# NAME      -  JASON SNEDDON
# DATE      -  29 NOVEMBER 2016
# CS 436    -  INTRODUCTION TO NETWORKING
# PROJECT 1 -  NETWORK SIMULATION USING NS2
#
#
# PURPOSE: This is the awk file used to calculate the total number 
#          of packets SENT from server7 at each 0.5 second time 
#          interval. Use the number of packets received (r) at 
#		     the 2nd hop on the source to destination path that 
#		     belongs to the same flowID
#
# @USAGE: $ awk -f 7sent.awk project1out.tr
#==================================================================


BEGIN {

	# Calculate number of packets sent to node 0 (2nd hop) from node 1
   node = 0;
   time1 = 0.0;
   time2 = 0.0;

   numPacketsSent = 0;
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

      printf("%f \t %f\n", time2, numPacketsSent) > "7sent.xls";

		# Output interval results to terminal
		printf("%f \t    ", time2);
		print int( numPacketsSent );

		# Update time1      
		time1 = $2;

		# Update totalPackets sent
		totalPktsSent = totalPktsSent + numPacketsSent;
		totalRouter = totalRouter + numPktsRouter;

		# Reset the number of packets
		numPacketsSent = 0;
		numPktsRouter = 0;

   }

	# Filter for packets sent from router 1 to router 0
   if ($1 == "r" && $3 == 1 && $4 == 0 && $5 == "cbr" && $8 == 7) {
      numPacketsSent++;
   }

	# Filter for packets sent from server7 to router1
	if ( $1 == "+" && $3 == 7 && $4 == 1 && $5 "cbr" && $8 == 7 ) {
      numPktsRouter++;
   }
}

END {

printf("------------------------------\n");
printf("Total =\t\t   %d", totalPktsSent);

# This is total packets sent using (r) at the 2nd hop (node 0)
printf("\n\n~ ~ ~ ~ ~ ~ ~ ~ ~ ~ SUMMARY ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n");
printf("Total number of packets sent from server 7\n");
printf("to the destination 19 using the number of \n");
printf("packets received (r) at the 2nd hop = \n\n\t\t%d", totalPktsSent);
printf("\n===========================================\n\n");

# This is the total packets sent using (+) at the 1st hop (node 1)
printf("Total number of packets sent from server 7\n");
printf("to the destination 19 using the number of \n");
printf("packets enqueue (+) at the router 1 = \n\n\t\t%d", totalRouter);
printf("\n===========================================\n\n");

}



#=====================     END FILE     ===========================
