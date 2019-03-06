;; DWG FOO 
;;This routine is used to clean up a drawing for usage. It cleans up unneeded data
;; DEFUN is the function
;; C: tells autocad what the command is 
;; FOO is the command to start the script
;; () indicates no local variables and no arguments
(DEFUN C:FOO ()
 (SETVAR "CMDECHO" 0);; turn echo off-turns off the read out of the following commands
 (setq cntr 1) ;; sets a counter variable
 (command "-layer" "Thaw" "*" "ON" "*" "UNLOCK" "*" "S" "0" "") ;; thaws, turns on and unlocks all layers then sets the current layer to 0
 (command "SETBYLAYER" "ALL" "" "Y" "Y");; set all objects to be "ByLayer"
 (command "AUDIT" "Y");; runs an audit to fix errors
 (repeat 4 ;; repeat following commands  4 times	
  (command "-overkill" all "" "");; overkill everything
 );;
 (repeat 2 ;; repeat following commands  2 times	
  (command "-PURGE" "A" "*" "N");; purge drawing
 );;
 (command "ZOOM" "E");; zoom to extents
 (command "QSAVE");; quicksave
 (SETVAR "CMDECHO" 1);; turn echo on-turns on the read out of commands
 (printc "\nFOO has been complete!")
);;END DEFUN