# ProVer 3040 XL Operation Guide

## Program Requirements:
* One tool per file
* Configure setup to NOT go to Z0 at the start (Z0 will trip limit switch and cause an error)
* Configure setup to NOT home at the start

## Initial Setup
1. Home the machine
2. Put probe bar in spindle
3. Position probe plate and connect magnet to collet nut
   * Touch plate to tool to verify probe circuit
5. Move tool <1/4" over plate and select Probe Z in probing section of CNCjs (arrow keys, pg up/dwn)
6. Position probe in probe plate hole
7. Hold plate in place and run ProbeHoleCenter in macro section of CNCjs
8. Run LoadFirstTool macro

## Run Program
1. Run ChangeTool macro
   * While paused, put desired tool in spindle
2. Resume
3. Upload g-code
4. Cycle start
