; ***This macro should be run to establish your tool length offset AFTER you set your original Z work zero***
; ***Any tool changes can use the New_Tool macro***

; Wait until the planner queue is empty
%wait

; Set user-defined variables
%global.state.SAFE_HEIGHT = -5 ; clear everything height(negative number, distance below Z limit)
%global.state.PROBE_DISTANCE = 110
%global.state.PROBE_RAPID_FEEDRATE = 500 ;mm/min

%wait

; Keep a backup of current work position
%X0=posx, Y0=posy, Z0=posz

; Save modal state
%WCS = modal.wcs
%PLANE = modal.plane
%UNITS = modal.units
%DISTANCE = modal.distance
%FEEDRATE = modal.feedrate
%SPINDLE = modal.spindle
%COOLANT = modal.coolant

G21 ; Use metric units
M5  ; Stop spindle
G90	; Absolute positioning

G28

%wait

M0 ; Set up for probing...pause for attaching wires and stuff

G91
G38.2 Z-[global.state.PROBE_DISTANCE] F[global.state.PROBE_RAPID_FEEDRATE] ; fast probe
G0 z2
G38.2 z-5 F40	; slow "dial-it-in" probes
G4 P.25
G38.4 z10 F20	; slow "dial-it-in" probes
G4 P.25
G38.2 z-2 F10	; slow "dial-it-in" probes
G4 P.25
G38.4 z10 F5	; slow "dial-it-in" probes
G4 P.25
G90
%global.state.TOOL_REFERENCE = posz	; establish a global tool reference work offset

%wait

(TOOL_REFERENCE = [global.state.TOOL_REFERENCE])

G91
G0 Z5
G90
G28

%wait

M0 ; Pause the program for cleanup (e.g. remove touch plate, wires, etc)

; Restore modal state
[WCS] [PLANE] [UNITS] [DISTANCE] [FEEDRATE] [SPINDLE] [COOLANT]
