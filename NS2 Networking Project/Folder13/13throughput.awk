#==================================================================
# NAME      -  JASON SNEDDON
# DATE      -  29 NOVEMBER 2016
# CS 436    -  INTRODUCTION TO NETWORKING
# PROJECT 1 -  NETWORK SIMULATION USING NS2
#
#
# PURPOSE: This is the awk file used to calculate the throughput 
#          for greenDest28 where the packets are being sent from 
#          server13. Throughput is the number of packets received 
#          successfully in a unit of time, represented in bits per second.
# CALCULATION:
#    Throughput = data_received_at_destination / dataTransmissionPeriod
#
# @USAGE: $ awk -f 13throughput.awk project1out.tr
#=====================================================================
BEGIN {
	# Initialize variables
	time1 = 0.0;
	time2 = 0.0;

	num_packets = 0;
	totalBytes = 0;

	throughput = 0.0;
	totalThroughput = 0.0;

	printf("\n\n~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ REPORT ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n\n");
	printf(" Time\t\t  Throughput\n");
	printf("-----------\t---------------\n");
}

# BODY
{
	# Get initial time
	time2 = $2;

	# Calculate throughput for every 0.5 second interval
	if ( time2 - time1 > 0.5 ) {

		# Calculate throughput 
		throughput = bytes_counter / (time2 - time1);

		# Write to file
		printf("%f \t %f \n", time2, throughput) > "13throughput.xls";

		#Output to terminal
		printf("\n  %3.1f \t\t  %f \n", time2, throughput);

		# Add to total throughput
		totalThroughput = totalThroughput + throughput;

		# Update time1
		time1 = $2;

		# Reset bytes
		bytes_counter = 0;
		
		# Reset number of packets received
		num_packets = 0;

		# Reset Throughput
		throughput = 0;

	}

	# Filter using flowID as 13
	if($1 == "r" && $3 == 6 && $4 == 28 && $8 == 13) {
		
		bytes_counter += $6;
		totalBytes = totalBytes + bytes_counter;
		num_packets++;
	}

}

END {

	printf("\n==========================================\n");
	printf("\t     END RESULTS");
	printf("\n==========================================\n\n");

}





#=====================     END FILE     =============================
