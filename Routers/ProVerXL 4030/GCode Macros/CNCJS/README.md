# ProVer 3040 XL Operation Guide

## Gcode Program Requirements
This is described for Fusion 360 but applies to any CAM program

* Configure the post to split the output file by tool
   * This will generate separate gcode files for each tool
   * We will run a macro to change tools between programs
   * Configure the post to NOT output `M6` since we will change tools between programs instead of at the start of one
* Configure setup to NOT go to Z0 at the start (Z0 will trip limit switch and cause an error)
* Configure the post to use `G28` for its safe location
   * This will output a `G28` at the end of the file
   * Originally, this would trip our Z limit switch, but this was resolved by using `G28.1` to set a custom safe location

## Machine Setup
1. Open CNCjs and connect to the router
2. Home the machine by clicking `Homing` or running `$H`
3. Set the work coordinate system Z0
   a. Put the 1/4" or 1/8" stainless steel dowel pin into the router
   c. **Connect the magnet to the collet nut**
   d. Confirm that the magnet is working by tapping the plate against the dowel pin and observing the touch plate led color change
   b. Position the touch plate so that the hole is at the (0, 0) corner
   e. Move the end of the dowel pin within 10mm over the touch plate
   f. In the Probe section, select Z and click `Probe` while holding the touch plate down
      * A dialog will open showing the probing routine, click `Probe` or `OK` or whatever
   h. Move the end of the dowel pin into the touch plate hole, down approximately 2mm
   i. In the Macro section, run the `ProbeHoleCenter` macro while holding the touch plate down
      * A dialog will open showing the probing routine, click `OK` or whatever
4. In the Macro section, run the `LoadFirstTool` macro
   a. A dialog will open showing the routine, click `OK` or whatever
   b. After moving above the tool length button, a pause dialog will open, click `Continue`
   c. After touching off, a pause dialog will open, click `Continue`
   
## Run Program
1. Run ChangeTool macro
   * While paused, put desired tool in spindle
2. Resume
3. Upload g-code
4. Cycle start
