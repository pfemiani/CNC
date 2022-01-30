# ProVer 3040 XL Operation Guide

## Program Requirements:
* One tool per file
* Configure setup to NOT go to Z0 at the start (Z0 will trip limit switch and cause an error)
* Configure setup to NOT home at the start

## Initial Setup
1. Home the machine
2. Put probe bar in spindle
3. Position probe plate and connect magnet
4. Probe Z on probe plate
	TODO: Confirm that this zeros Z in the machine coordinates
5. Position probe in probe plate hole
6. Run ProbeHoleCenter macro
7. Run LoadFirstTool macro

## Run Program
1. Run ChangeTool macro
* While paused, put desired tool in spindle
2. Resume
3. Upload g-code
4. Cycle start
