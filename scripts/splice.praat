## This script splices out segments of sound from a Text-Grid-annotated sound file. 
## It will splice any non-empty interval on Tier 1 and save it as a .wav file in a user-specified directory. 
## The script, sound file, and text grid need to be in the same directory.

#### USER INPUT #####

## sound file (in .wav format) and textgrid need to have the same name.
#filename$ = "poss_stimuli"
filename$ = “FEMALE_HS_N_NORM”
#filename$ = "poop_basket"

## directory which will house the new individual sound files
## (this needs to be created before running the script)
newdir$ = "spliced/"

#####################

## Read in sound file and TextGrid
#do ("Read from file...", "/Users/miep/Sounds/Animals/miauw.aifc")
Open long sound file... 'filename$'.wav
Read from file... 'filename$'.TextGrid

## Find out how many intervals to loop through...
select TextGrid 'filename$'
num = Get number of intervals... 1

## ...and loop through them
for i from 1 to num
	select TextGrid 'filename$'
	word$ = Get label of interval... 1 i
	if word$ != ""
		start = Get start point... 1 i
		end = Get end point... 1 i
		select LongSound 'filename$'
		sound_part = Extract part... start end no
		Save as WAV file... 'newdir$''word$'.wav
		select 'sound_part'
		Remove
	endif
endfor


