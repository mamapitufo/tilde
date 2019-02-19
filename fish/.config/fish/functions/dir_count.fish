function dir_count --description "Prints the number of files in each directory in the current directory"
	for dir in (ls -d */)
		echo $dir (count $dir/*)
	end
end
