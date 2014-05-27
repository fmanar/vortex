vortex
joneslab code for vortex identification and tracking

Please see 'standards.txt' for data structure layout and function handle
  standards.

Work flow: Field recommends that any scripts you write using these functions be 
	kept in a seperate folder.  Matlab can be told about all of these functions
	with an addpath() command.  Matlab can also be configured to add the path at
	startup by adding the command to startup.m in the Documents/MATLAB folder.
	
	When editing this codebase, please create branch (fork?) the project so you
	don't muddy other people's code.

Folders:
  data - sample data sets
  diff - finite differencing schemes
  gen  - general purpose functions
  id   - vortex id functions
  io   - input and output of vector files
  plot - plotting functions
