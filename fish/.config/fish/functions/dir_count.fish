function dir_count --description "Prints the number of files in each directory in the current directory"
	for dir in (find . -maxdepth 1 -mindepth 1 -type d| sort)
		echo $dir: (count $dir/*)
	end
end
