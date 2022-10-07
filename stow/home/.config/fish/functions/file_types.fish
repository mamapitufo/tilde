function file_types --description "Prints a list of the different file extensions in the current directory"
	find . -maxdepth 1 -type f | awk -F. '!a[$NF]++{print $NF}'	| sort
end
