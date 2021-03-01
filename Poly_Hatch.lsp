;------------------------------------------------------------------------
; Script to find and hatch all closed polylines within a selection
; and specific layers to depict how actual mask will look like.
; - First input is the layers name seperated by ","
; - Second input is making the selection
; -Hit the Enter/Space to see the result
;
; Developed by Vahid Ganjalizadeh 					April, 2017
;------------------------------------------------------------------------

(defun C:POLYHATCH ()
	(command)
	(vlax-for lyr
		(vla-get-layers
			(vla-get-activedocument
				(vlax-get-acad-object)
			)
		)
		(setq lays (cons (vla-get-name lyr) table))
	)
	(princ "Available layers: ")
	(princ lays)
	(princ "\n")
	(setq sellays (getstring "Input layers as lay1,lay2,... : "))
	(setq lay1 (cons 8 sellays))
	; (setq filters (list (0 . "*POLYLINE") lay1 (70 . 1)))
	; (print filters)
	; (print '((0 . "*POLYLINE") (70 . 1)))
	; (print (list (8 . lay1) (70 . 1)))
	(if (= sellays "all")
		(progn
			(setq sel1 (ssget (list (cons 0 "*POLYLINE") (cons 70 1))))
		)
		(setq sel1 (ssget (list (cons 0 "*POLYLINE") lay1 (cons 70 1))))
	)
	(setq i 0)
	(setq t 0)
	(repeat (sslength sel1)            ;loop for every entity in the set
		(setq en (ssname sel1 i))       ;get entity name
		(print en)
		(setq ent (ssadd))
		(ssadd en ent)
		; (setq ed (entget en))           ;get entity definition
	; (command "._-HATCH" "s" sel1 "" "Properties" "Solid" "Advanced" "Island" "No" "Nearest" "Style" "Ignore" "Gap" 0.0 "" "")
		(command "._-HATCH" "s" ent "" "Properties" "Solid" "Advanced" "Island" "No" "Nearest" "Style" "Ignore" "Gap" 0.0 "" "")
		(setq htch (ssget "L"))
		(if (= t 0)
			(progn
				(setq t 1)
				(setq htch_g (getstring "Enter a name to create a hatch group: "))
				(command "_.-GROUP" "Create" htch_g "" htch "")
			)
			(progn
				(command "_.-GROUP" "Add" htch_g htch "")
			)
		)
	; (command "._-HATCH" "s" sel1 "" "Properties" "Solid" "Advanced" "Island" "Yes" "Style" "Normal" "Gap" 0.0 "" "")
		(setq i (+ i 1))                       ;increment the counter
		(redraw)
	)
	(princ)
	(print "Finished!")
)