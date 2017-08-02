#============================================================
# NAME      -  JASON SNEDDON
# DATE      -  29 NOVEMBER 2016
# CS 436    -  INTRODUCTION TO NETWORKING
# PROJECT 1 -  NETWORK SIMULATION USING NS2
#============================================================

# Create a simulator object
set ns [new Simulator]

# Use dynamic routing
$ns rtproto DV

# Open the output file
set p1Trace [open project1out.tr w]
$ns trace-all $p1Trace

#======================================
# Open the NAM trace file
set nf [open project1_out.nam w]
$ns namtrace-all $nf
#======================================

# Define a finish procedure
proc finish {} {
     global p1Trace
     global ns nf
     $ns flush-trace
     # Close output file
     close $p1Trace

     close $nf
     exec nam project1_out.nam &
     exit 0
}
#============================================================
# **********     Create all nodes     **********
#============================================================
# Create $router0 as green
set router0 [$ns node]
$router0 color green
$router0 shape "square"

# Create $router1 as red
set router1 [$ns node]
$router1 color red
$router1 shape "square"

# Create $router2 as green
set router2 [$ns node]
$router2 color green
$router2 shape "square"

# Create $router3 as blue
set router3 [$ns node]
$router3 color blue
$router3 shape "square"

# Create $router4 as green
set router4 [$ns node]
$router4 color green
$router4 shape "square"

# Create $router5 as blue
set router5 [$ns node]
$router5 color blue
$router5 shape "square"

# Create $router6 as blue
set router6 [$ns node]
$router6 color blue
$router6 shape "square"

# Create $server7 for red source
set server7 [$ns node]
$server7 shape "hexagon"
$server7 color red

# Create bludeDest8 and blueDest9
set blueDest8 [$ns node]
$blueDest8 color blue
set blueDest9 [$ns node]
$blueDest9 color blue

# Create dest node 10
set dest10 [$ns node]

# Create blueDest11
set blueDest11 [$ns node]
$blueDest11 color blue

# Create $server12 for green source
set server12 [$ns node]
$server12 shape "hexagon"
$server12 color green

# Create $server13 for green source
set server13 [$ns node]
$server13 shape "hexagon"
$server13 color green

# Create $server14 for blue source traffic
set server14 [$ns node]
$server14 shape "hexagon"
$server14 color blue

# Create redDest15 and redDest16
set redDest15 [$ns node]
$redDest15 color red
set redDest16 [$ns node]
$redDest16 color red

# Create redDest17
set redDest17 [$ns node]
$redDest17 color red

# Create blueDest18
set blueDest18 [$ns node]
$blueDest18 color blue

# Create redDest19
set redDest19 [$ns node]
$redDest19 color red

# Create blueDest20
set blueDest20 [$ns node]
$blueDest20 color blue

# Create redDest21
set redDest21 [$ns node]
$redDest21 color red

# Create dest22
set dest22 [$ns node]

# Create blueDest23
set blueDest23 [$ns node]
$blueDest23 color blue

# Create redDest24, redDest25, redDest26
set redDest24 [$ns node]
$redDest24 color red
set redDest25 [$ns node]
$redDest25 color red
set redDest26 [$ns node]
$redDest26 color red

# Create blueDest27
set blueDest27 [$ns node]
$blueDest27 color blue

# Create greenDest28
set greenDest28 [$ns node]
$greenDest28 color green

#============================================================
#  **********   Create all links between nodes   **********
#============================================================
#============================================================
# Create links between the center routers:
# This is a duplex-link with 8Mb 50ms DropTail queue-limit 20
#============================================================
# Link between $router0 and $router1
$ns duplex-link $router0 $router1 8Mb 50ms DropTail
$ns queue-limit $router0 $router1 20
$ns duplex-link-op $router0 $router1 orient right

# Link between $router0 and $router2
$ns duplex-link $router0 $router2 8Mb 50ms DropTail
$ns queue-limit $router0 $router2 20
$ns duplex-link-op $router0 $router2 orient down

# Link between $router1 and $router3
$ns duplex-link $router1 $router3 8Mb 50ms DropTail
$ns queue-limit $router1 $router3 20
$ns duplex-link-op $router1 $router3 orient down

# Link betwee $router2 and $router3
$ns duplex-link $router2 $router3 8Mb 50ms DropTail
$ns queue-limit $router2 $router3 20
$ns duplex-link-op $router2 $router3 orient right

#============================================================
# Create links between:
#   These links will be colored purple with the attributes:
#    - duplex-link 2Mb 40ms DropTail
#    - queue-limit between links is 15
#============================================================
# Link between $router2 and $router4
$ns duplex-link $router2 $router4 2Mb 40ms DropTail
$ns queue-limit $router2 $router4 15
$ns duplex-link-op $router2 $router4 color "purple"
$ns duplex-link-op $router2 $router4 orient down-left

# Link between $router3 and $router5
$ns duplex-link $router3 $router5 2Mb 40ms DropTail
$ns queue-limit $router3 $router5 15
$ns duplex-link-op $router3 $router5 color "purple"
$ns duplex-link-op $router3 $router5 orient down

# Link between $router3 and $router6
$ns duplex-link $router3 $router6 2Mb 40ms DropTail
$ns queue-limit $router3 $router6 15
$ns duplex-link-op $router3 $router6 color "purple"
$ns duplex-link-op $router3 $router6 orient right

#============================================================
# Create duplex-links from $router0
# These links will be yellow with the attributes:
#    - 1Mb, 20ms, DropTail, Queue-Limit 10
#    - queue-limit for each is 10
#============================================================
# Link between $router0 and $server13
$ns duplex-link $router0 $server13 1Mb 20ms DropTail
$ns queue-limit $router0 $server13 10
$ns duplex-link-op $router0 $server13 color "yellow"
$ns duplex-link-op $router0 $server13 orient up

# Link between $router0 and $server14
$ns duplex-link $router0 $server14 1Mb 20ms DropTail
$ns queue-limit $router0 $server14 10
$ns duplex-link-op $router0 $server14 color "yellow"
$ns duplex-link-op $router0 $server14 orient up-left

# Link between $router0 and $redDest15
$ns duplex-link $router0 $redDest15 1Mb 20ms DropTail
$ns queue-limit $router0 $redDest15 10
$ns duplex-link-op $router0 $redDest15 color "yellow"
$ns duplex-link-op $router0 $redDest15 orient left

# Link between $router0 and $redDest16
$ns duplex-link $router0 $redDest16 1Mb 20ms DropTail
$ns queue-limit $router0 $redDest16 10
$ns duplex-link-op $router0 $redDest16 color "yellow"
$ns duplex-link-op $router0 $redDest16 orient left-down

#============================================================
# Create duplex-links from $router1
# These links will be yellow with the attributes:
#    - 1Mbps, 20ms, DropTail, Queue-Limit 10
#    - queue-limit for each is 10
#============================================================
# Link between $router1 and $server7
$ns duplex-link $router1 $server7 1Mb 20ms DropTail
$ns queue-limit $router1 $server7 10
$ns duplex-link-op $router1 $server7 color "yellow"
$ns duplex-link-op $router1 $server7 orient right-down

# Link between $router1 and $blueDest8
$ns duplex-link $router1 $blueDest8 1Mb 20ms DropTail
$ns queue-limit $router1 $blueDest8 10
$ns duplex-link-op $router1 $blueDest8 color "yellow"
$ns duplex-link-op $router1 $blueDest8 orient right

# Link between $router1 and $blueDest9
$ns duplex-link $router1 $blueDest9 1Mb 20ms DropTail
$ns queue-limit $router1 $blueDest9 10
$ns duplex-link-op $router1 $blueDest9 color "yellow"
$ns duplex-link-op $router1 $blueDest9 orient right-up

# Link between $router1 and $dest10
$ns duplex-link $router1 $dest10 1Mb 20ms DropTail
$ns queue-limit $router1 $dest10 10
$ns duplex-link-op $router1 $dest10 color "yellow"
$ns duplex-link-op $router1 $dest10 orient down-left

# Link between $router1 and $blueDest11
$ns duplex-link $router1 $blueDest11 1Mb 20ms DropTail
$ns queue-limit $router1 $blueDest11 10
$ns duplex-link-op $router1 $blueDest11 color "yellow"
$ns duplex-link-op $router1 $blueDest11 orient up

# Link between $router1 and $server12
$ns duplex-link $router1 $server12 1Mb 20ms DropTail
$ns queue-limit $router1 $server12 10
$ns duplex-link-op $router1 $server12 color "yellow"
$ns duplex-link-op $router1 $server12 orient up-left

#============================================================
# Create duplex-links from $router4
# These links will be yellow with the attributes:
#    - 1Mbps, 20ms, DropTail, Queue-Limit 10
#    - queue-limit for each is 10
#============================================================
# Link between $router4 and $redDest17
$ns duplex-link $router4 $redDest17 1Mb 20ms DropTail
$ns queue-limit $router4 $redDest17 10
$ns duplex-link-op $router4 $redDest17 color "yellow"
$ns duplex-link-op $router4 $redDest17 orient left-up

# Link between $router4 and $blueDest18
$ns duplex-link $router4 $blueDest18 1Mb 20ms DropTail
$ns queue-limit $router4 $blueDest18 10
$ns duplex-link-op $router4 $blueDest18 color "yellow"
$ns duplex-link-op $router4 $blueDest18 orient left

# Link between $router4 and $redDest19
$ns duplex-link $router4 $redDest19 1Mb 20ms DropTail
$ns queue-limit $router4 $redDest19 10
$ns duplex-link-op $router4 $redDest19 color "yellow"
$ns duplex-link-op $router4 $redDest19 orient down-left

# Link between $router4 and $blueDest20
$ns duplex-link $router4 $blueDest20 1Mb 20ms DropTail
$ns queue-limit $router4 $blueDest20 10
$ns duplex-link-op $router4 $blueDest20 color "yellow"
$ns duplex-link-op $router4 $blueDest20 orient down

#============================================================
# Create duplex-links from $router5
# These links will be yellow with the attributes:
#    - 1Mbps, 20ms, DropTail, Queue-Limit 10
#    - queue-limit for each is 10
#============================================================
# Link between $router5 and $redDest21
$ns duplex-link $router5 $redDest21 1Mb 20ms DropTail
$ns queue-limit $router5 $redDest21 10
$ns duplex-link-op $router5 $redDest21 color "yellow"
$ns duplex-link-op $router5 $redDest21 orient left

# Link between $router5 and $dest22
$ns duplex-link $router5 $dest22 1Mb 20ms DropTail
$ns queue-limit $router5 $dest22 10
$ns duplex-link-op $router5 $dest22 color "yellow"
$ns duplex-link-op $router5 $dest22 orient down-left

# Link between $router5 and $blueDest23
$ns duplex-link $router5 $blueDest23 1Mb 20ms DropTail
$ns queue-limit $router5 $blueDest23 10
$ns duplex-link-op $router5 $blueDest23 color "yellow"
$ns duplex-link-op $router5 $blueDest23 orient down

# Link between $router5 and $redDest24
$ns duplex-link $router5 $redDest24 1Mb 20ms DropTail
$ns queue-limit $router5 $redDest24 10
$ns duplex-link-op $router5 $redDest24 color "yellow"
$ns duplex-link-op $router5 $redDest24 orient down-right

#============================================================
# Create duplex-links from $router6
# These links will be yellow with the attributes:
#    - 1Mbps, 20ms, DropTail, Queue-Limit 10
#    - queue-limit for each is 10
#============================================================
# Link between $router6 and $redDest25
$ns duplex-link $router6 $redDest25 1Mb 20ms DropTail
$ns queue-limit $router6 $redDest25 10
$ns duplex-link-op $router6 $redDest25 color "yellow"
$ns duplex-link-op $router6 $redDest25 orient down-left

# Link between $router6 and $redDest26
$ns duplex-link $router6 $redDest26 1Mb 20ms DropTail
$ns queue-limit $router6 $redDest26 10
$ns duplex-link-op $router6 $redDest26 color "yellow"
$ns duplex-link-op $router6 $redDest26 orient down

# Link between $router6 and $blueDest27
$ns duplex-link $router6 $blueDest27 1Mb 20ms DropTail
$ns queue-limit $router6 $blueDest27 10
$ns duplex-link-op $router6 $blueDest27 color "yellow"
$ns duplex-link-op $router6 $blueDest27 orient down-right

# Link between $router6 and $greenDest28
$ns duplex-link $router6 $greenDest28 1Mb 20ms DropTail
$ns queue-limit $router6 $greenDest28 10
$ns duplex-link-op $router6 $greenDest28 color "yellow"
$ns duplex-link-op $router6 $greenDest28 orient right

#============================================================
# This is CBR over UDP for RED CONNECTIONS
# This procedure creates a UDP agent and attachs the UDP agent
# to a node. It then creates a CBR traffic source with the
# values for packetSize, interval, and random. Next it attachs
# a CBR traffic source to the UDP agent. Then, it connects the
# UDP agent to a LossMonitor.
#    @PARAMS:
#         - node is a previously created node to attach the
#             UDP agent to.
#         - sink is the previously created LossMonitor that
#             needs to be connected to the UDP agent
#         - size is the packetSize
#         - interval is the time interval
#         - random is true
#    @RETURN:
#         - This returns the source object, which is the UDP
#           agent with all connections.
#============================================================
proc attach-cbr-traffic { node sink size interval random } {
     # Get an instance of the simulator
     set nsInstance [Simulator instance]

     # Create a UDP agent
     set udpSource [new Agent/UDP]

     # Attach UDP agent to the node
     $nsInstance attach-agent $node $udpSource

     # Create a CBR traffic agent and set its values
     set cbrAgent [new Application/Traffic/CBR]
     $cbrAgent set packetSize_ $size
     $cbrAgent set interval_ $interval
     $cbrAgent set random_ $random

     # Attach CBR agent to UDP traffic generator
     $cbrAgent attach-agent $udpSource

     # Connect the UDP agent to the LossMonitor (sink)
     $nsInstance connect $udpSource $sink

     # Return CBR traffic generator
     return $cbrAgent
}

#============================================================
# This is EXP over UDP for BLUE CONNECTIONS
# This procedure creates a UDP agent and attachs the UDP agent
# to a node. It then creates a EXP traffic source with the
# values for packetSize, burst_time, idle_time, and rate. Next it attachs
# the EXP traffic source to the UDP agent. Then, it connects the
# UDP agent to a LossMonitor, and returns the EXP traffic source
#    @PARAMS:
#         - node is a previously created node to attach the
#             UDP agent to.
#         - sink is the previously created LossMonitor that
#             needs to be connected to the UDP agent
#         - size is the packetSize
#         - burst is burst time
#         - idle is idle time
#         - rate is burst peak rate
#    @RETURN:
#         - This returns the source object, which is the UDP
#           agent with all connections.
#============================================================
proc attach-exp-traffic { node sink size burst idle rate } {
     # Get an instance of the simulator
     set nsInstance [Simulator instance]

     # Create a UDP agent
     set udpSource [new Agent/UDP]
#     $udpSource set class_ 2

     # Attach UDP agent to the node
     $nsInstance attach-agent $node $udpSource

     # Create an EXP traffic agent and set its values
     set expAgent [new Application/Traffic/Exponential]
     $expAgent set packetSize_ $size
     $expAgent set burst_time_ $burst
	  $expAgent set idle_time_ $idle
	  $expAgent set rate_ $rate

     # Attach EXP agent to UDP traffic generator
     $expAgent attach-agent $udpSource

     # Connect the UDP agent to the LossMonitor (sink)
     $nsInstance connect $udpSource $sink

     # Return EXP traffic generator
     return $expAgent
}

#============================================================
# Create all traffic sinks (LossMonitors) for Red Destinations
#============================================================
# Create sink and attach to $redDest15
set redSink0 [new Agent/LossMonitor]
$ns attach-agent $redDest15 $redSink0

# Create sink and attach to $redDest16
set redSink1 [new Agent/LossMonitor]
$ns attach-agent $redDest16 $redSink1

# Create sink and attach to $redDest17
set redSink2 [new Agent/LossMonitor]
$ns attach-agent $redDest17 $redSink2

# Create sink and attach to $redDest21
set redSink4 [new Agent/LossMonitor]
$ns attach-agent $redDest21 $redSink4

# Create sink and attach to $redDest24
set redSink5 [new Agent/LossMonitor]
$ns attach-agent $redDest24 $redSink5

# Create sink and attach to $redDest25
set redSink6 [new Agent/LossMonitor]
$ns attach-agent $redDest25 $redSink6

# Create sink and attach to $redDest26
set redSink7 [new Agent/LossMonitor]
$ns attach-agent $redDest26 $redSink7

#============================================================
# Create 8 traffic generators, one for each red connection.
#============================================================
# CBR over UDP and LossMonitor for $redDest15
set redSource0 [attach-cbr-traffic $server7 $redSink0 1500 0.005 1]

# CBR over UDP and LossMonitor for $redDest16
set redSource1 [attach-cbr-traffic $server7 $redSink1 1500 0.005 1]

# CBR over UDP and LossMonitor for $redDest17
set redSource2 [attach-cbr-traffic $server7 $redSink2 1500 0.005 1]

#============================================================
# Create 1 UDP agent and 1 CBR traffic generator at server7
# and create 1 LossMonitor traffic sink at redDest19.
# 	- To track the data flow for this, use flowID = 7
#============================================================
# Create a UDP agent for server7 and redDest19
set udpRed7 [new Agent/UDP]

# Attach UDP agent, udpRed, to server7
$ns attach-agent $server7 $udpRed7

# Create sink and attach to $redDest19 for server7
set redSink3 [new Agent/LossMonitor]
$ns attach-agent $redDest19 $redSink3

# Connect the UDP agent to the LossMonitor sink
$ns connect $udpRed7 $redSink3

# Set flowID to track data flow
$udpRed7 set fid_ 7

# Create a CBR traffic generator for server7 
set cbrRed7 [new Application/Traffic/CBR]

# Attach CBR traffic generator to UDP agent
$cbrRed7 attach-agent $udpRed7

# Set value CBR values
$cbrRed7 set type_ CBR
$cbrRed7 set packetSize_ 1000
$cbrRed7 set interval_ 0.005
$cbrRed7 set random_ 1
#==========     END SERVER 7     ============================

# CBR over UDP and LossMonitor for $redDest21
set redSource4 [attach-cbr-traffic $server7 $redSink4 1500 0.005 1]

# CBR over UDP and LossMonitor for $redDest24
set redSource5 [attach-cbr-traffic $server7 $redSink5 1500 0.005 1]

# CBR over UDP and LossMonitor for $redDest25
set redSource6 [attach-cbr-traffic $server7 $redSink6 1500 0.005 1]

# CBR over UDP and LossMonitor for $redDest26
set redSource7 [attach-cbr-traffic $server7 $redSink7 1500 0.005 1]

#============================================================
# Create a traffic sink (LossMonitors) for each BLUE Destination
#============================================================
# Create sink and attach to $blueDest8
set blueSink0 [new Agent/LossMonitor]
$ns attach-agent $blueDest8 $blueSink0

# Create sink and attach to $blueDest9
set blueSink1 [new Agent/LossMonitor]
$ns attach-agent $blueDest9 $blueSink1

# Create sink and attach to $blueDest11
set blueSink2 [new Agent/LossMonitor]
$ns attach-agent $blueDest11 $blueSink2

# Create sink and attach to $blueDest18
set blueSink3 [new Agent/LossMonitor]
$ns attach-agent $blueDest18 $blueSink3

# Create sink and attach to $blueDest20
set blueSink4 [new Agent/LossMonitor]
$ns attach-agent $blueDest20 $blueSink4

# Create sink and attach to $blueDest23
set blueSink5 [new Agent/LossMonitor]
$ns attach-agent $blueDest23 $blueSink5

#============================================================
# Create one traffic generator for each BLUE connection
#============================================================
# EXP over UDP and LossMonitor for $blueDest8
set blueSource0 [attach-exp-traffic $server14 $blueSink0 2000 0.5s 0.5s 2000k]

# EXP over UDP and LossMonitor for $blueDest9
set blueSource1 [attach-exp-traffic $server14 $blueSink1 2000 0.5s 0.5s 2000k]

# EXP over UDP and LossMonitor for $blueDest11
set blueSource2 [attach-exp-traffic $server14 $blueSink2 2000 0.5s 0.5s 2000k]

# EXP over UDP and LossMonitor for $bludeDest18
set blueSource3 [attach-exp-traffic $server14 $blueSink3 2000 0.5s 0.5s 2000k]

# EXP over UDP and LossMonitor for $bludeDest20
set blueSource4 [attach-exp-traffic $server14 $blueSink4 2000 0.5s 0.5s 2000k]

# EXP over UDP and LossMonitor for $bludeDest23
set blueSource5 [attach-exp-traffic $server14 $blueSink5 2000 0.5s 0.5s 2000k]

#============================================================
# Create 1 UDP agent and 1 EXP traffic generator at server14
# and create 1 Loss Monitor (sink) at blueDest27
# 	- To track the data flow for this, use flowID = 14
#============================================================

# Create a UDP agent 
set udp14 [new Agent/UDP]

# Attach UDP agent to server14 node
$ns attach-agent $server14 $udp14

# Create sink
set blueSink6 [new Agent/LossMonitor]

# Attach sink to node 27
$ns attach-agent $blueDest27 $blueSink6

# Connect the UDP agent to the LossMonitor (sink)
$ns connect $udp14 $blueSink6

# Set flowID to track data flow
$udp14 set fid_ 14

# Create an EXP traffic generator
set expBlue14 [new Application/Traffic/Exponential]

# Attach EXP traffic generator to UDP agent
$expBlue14 attach-agent $udp14

# Set values
$expBlue14 set type_ EXP
$expBlue14 set packetSize_ 2000  
$expBlue14 set burst_time_ 0.5s 
$expBlue14 set idle_time_ 0.5s
$expBlue14 set rate_ 2000k

#==========     END SERVER 14     ============================

#============================================================
# Create 1 TCP agent and 1 CBR traffic generator at server12,
# and create a LossMonitor sink at greenDest28
#============================================================
# Create a TCP agent
set tcp12 [new Agent/TCP]

# Attach TCP agent to the node
$ns attach-agent $server12 $tcp12

# Create sink and attach to $greenDest28 for server12
set greenSink0 [new Agent/LossMonitor]
$ns attach-agent $greenDest28 $greenSink0

# Connect the TCP agent to the LossMonitor (sink)
$ns connect $tcp12 $greenSink0

$tcp12 set fid_ 12

# Create a CBR traffic generator and set its values
set cbrGreen12 [new Application/Traffic/CBR]

# Attach CBR agent to TCP traffic generator
$cbrGreen12 attach-agent $tcp12

$cbrGreen12 set type_ CBR
$cbrGreen12 set packetSize_ 1000
$cbrGreen12 set interval_ 0.005
$cbrGreen12 set random_ 1

#==========     END SERVER 12     ============================

#============================================================
# Create 1 TCP agent and 1 CBR traffic generator at server13,
# and create a LossMonitor sink at greenDest28
#============================================================
# Create a TCP agent
set tcp13 [new Agent/TCP]

# Attach TCP agent to the node
$ns attach-agent $server13 $tcp13

# Create sink and attach to $greenDest28 for server13
set greenSink1 [new Agent/LossMonitor]
$ns attach-agent $greenDest28 $greenSink1

# Connect the TCP agent to the LossMonitor (sink)
$ns connect $tcp13 $greenSink1

$tcp13 set fid_ 13

# Create a CBR traffic generator and set its values
set cbrGreen13 [new Application/Traffic/CBR]

# Attach CBR agent to TCP traffic generator
$cbrGreen13 attach-agent $tcp13

$cbrGreen13 set type_ CBR
$cbrGreen13 set packetSize_ 1000
$cbrGreen13 set interval_ 0.005
$cbrGreen13 set random_ 1
#==========     END SERVER 13     ============================

#=======================================================================
# Schedule all events
#=======================================================================
# At time 1, all sources on $server7 start to generate traffic
$ns at 1.0 "$redSource0 start"
$ns at 1.0 "$redSource1 start"
$ns at 1.0 "$redSource2 start"
$ns at 1.0 "$cbrRed7 start"
$ns at 1.0 "$redSource4 start"
$ns at 1.0 "$redSource5 start"
$ns at 1.0 "$redSource6 start"
$ns at 1.0 "$redSource7 start"

# At time 2, all sources on $server14 start to generate traffic
$ns at 2.0 "$blueSource0 start"
$ns at 2.0 "$blueSource1 start"
$ns at 2.0 "$blueSource2 start"
$ns at 2.0 "$blueSource3 start"
$ns at 2.0 "$blueSource4 start"
$ns at 2.0 "$blueSource5 start"
$ns at 2.0 "$expBlue14 start"

# At time 3, the source on $server12 starts to generate traffic
$ns at 3.0 "$cbrGreen12 start"

# At time 4, the source on $server13 starts to generate traffic
$ns at 4.0 "$cbrGreen13 start"

# At time 6, the link between $router2 - $router3 goes DOWN
$ns rtmodel-at 6.0 down $router2 $router3

# At time 7, the link between $router2 - $router3 goes UP
$ns rtmodel-at 7.0 up $router2 $router3

# At time 10.0, stop all traffic sources
# Stop all red traffic
$ns at 10.0 "$redSource0 stop"
$ns at 10.0 "$redSource1 stop"
$ns at 10.0 "$redSource2 stop"
$ns at 10.0 "$cbrRed7 stop"
$ns at 10.0 "$redSource4 stop"
$ns at 10.0 "$redSource5 stop"
$ns at 10.0 "$redSource6 stop"
$ns at 10.0 "$redSource7 stop"

# Stop all blue traffic
$ns at 10.0 "$blueSource0 stop"
$ns at 10.0 "$blueSource1 stop"
$ns at 10.0 "$blueSource2 stop"
$ns at 10.0 "$blueSource3 stop"
$ns at 10.0 "$blueSource4 stop"
$ns at 10.0 "$blueSource5 stop"
$ns at 10.0 "$expBlue14 stop"

# Stop all green traffic
$ns at 10.0 "$cbrGreen12 stop"
$ns at 10.0 "$cbrGreen13 stop"

#=======================================================================
# Call the finish procedure after 10 seconds of simulation time
#=======================================================================
$ns at 10.0 "finish"

# Run the simulation
puts "Starting Project 1 Simulation.... "
$ns run



#=================     END FILE     ==================================
