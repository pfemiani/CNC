; ***WARNING - YOU MUST HAVE ALREADY RUN THE INITIAL TOOL MACRO FOR THIS TO WORK!***
; This macro allows you to use a fixed machine location for a tool change/probe. Ideal when you're workpiece surface has been carved away.

%wait ; Wait until the planner queue is empty

%X0=posx, Y0=posy, Z0=posz ; Keep a backup of current work position

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

G53 Z-5
G28

%wait

M0 ; Pause for manual tool change & probing

G91
G38.2 z-[global.state.PROBE_DISTANCE] F[global.state.PROBE_RAPID_FEEDRATE] ; fast probe
G0 z2
G38.2 z-5 F40	; Slow "dial-it-in" probes
G4 P.25
G38.4 z10 F20	; Slow "dial-it-in" probes
G4 P.25
G38.2 z-2 F10	; Slow "dial-it-in" probes
G4 P.25
G38.4 z10 F5	; Slow "dial-it-in" probes
G4 P.25
G90

%wait

G10 L20 Z[global.state.TOOL_REFERENCE] ; Update Z offset for new tool

%wait

G91
G0 Z5
G90
G28

%wait

M0 ; Pause the program for cleanup (e.G. remove touch plate, wires, etc)

; Restore modal state
[WCS] [PLANE] [UNITS] [DISTANCE] [FEEDRATE] [SPINDLE] [COOLANT]
