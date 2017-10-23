M190 S70.000000
M109 S210.000000
;Sliced at: Sat 28-11-2015 19:38:57
;Basic settings: Layer height: 0.1 Walls: 0.8 Fill: 20
;Print time: 0 minutes
;Filament used: 0.0m 0.0g
;Filament cost: None
;M190 S70 ;Uncomment to add your own bed temperature line
;M109 S210 ;Uncomment to add your own temperature line
G21        ;metric values
G90        ;absolute positioning
M82        ;set extruder to absolute mode
M107       ;start with the fan off
G28 X0 Y0  ;move X/Y to min endstops
G28 Z0     ;move Z to min endstops
G1 Z15.0 F9000 ;move the platform down 15mm
G92 E0                  ;zero the extruded length
G1 F200 E3              ;extrude 3mm of feed stock
G92 E0                  ;zero the extruded length again
G1 F9000
;Put printing message on LCD screen
M117 Printing...

;Layer count: 32
;LAYER:0
M107
;LAYER:1
M106 S127
;LAYER:2
M106 S255
;LAYER:3
;LAYER:4
;LAYER:5
;LAYER:6
;LAYER:7
;LAYER:8
;LAYER:9
;LAYER:10
;LAYER:11
;LAYER:12
;LAYER:13
;LAYER:14
;LAYER:15
;LAYER:16
;LAYER:17
;LAYER:18
;LAYER:19
;LAYER:20
;LAYER:21
;LAYER:22
;LAYER:23
;LAYER:24
;LAYER:25
;LAYER:26
;LAYER:27
;LAYER:28
;LAYER:29
;LAYER:30
;LAYER:31
M107
G1 F2400 E-4.50000
G0 F9000 X0.000 Y0.000 Z8.361
;End GCode
M104 S0                     ;extruder heater off
M140 S0                     ;heated bed heater off (if you have it)
G91                                    ;relative positioning
G1 E-1 F300                            ;retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 Z+0.5 E-5 X-20 Y-20 F9000 ;move Z up a bit and retract filament even more
G28 X0 Y0                              ;move X/Y to min endstops, so the head is out of the way
M84                         ;steppers off
G90                         ;absolute positioning
;CURA_PROFILE_STRING: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

