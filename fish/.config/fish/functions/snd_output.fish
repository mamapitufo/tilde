function snd_output --description "Prints out the current output (headphones, speaker, etc)"
	set headphone_count (amixer contents| grep -A2 "'Headphone Jack'"| grep -c ": values=on")
	if test $headphone_count -gt 0
		echo "Headphone"
	else
		echo "Speaker"
	end
end

