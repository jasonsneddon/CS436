# CS436

Implementation of a wired network topology using NS2. 

For this project I decided to use Linux so I could install NS2 easily and run all the files for the simulation locally. 

## TCL file
To run the TCL file from the command line: 
$ ns Sneddon_Jason.tcl. 

This would open the nam simulation to provide a visual of the network, and then it would generate a trace file called: Sneddon_Jason.tr. 

## AWK files
To execute all the AWK files: 
$ awk -f < file_name >.awk Sneddon_Jason.tr

For all the AWK files, I wrote the data to the associated files and output a report of the data to the terminal to make it more interactive. 

## Implementation Details
- __TCL File__ - For the TCL file, I decided to create all nodes individually, instead of using a for loop because I wanted to distinguish between the servers, routers, and destinations. 

- __Servers__ - I also implemented the connections for Server 7, Server 12, Server 13, and Server 14 individually because I found it easier to associate a unique flow id to the connections this way. 

- __Nodes__ - For all other nodes, I created 2 procedures, one that creates the red connections and one that creates the blue connections. 

- __Nam Simulation__ - Lastly, I found it very useful to execute a nam simulation from the TCL script because it provided a deeper understanding of how the data flows through the network. 
