#!/bin/bash
git status -sb . > add_patch.txt
input="add_patch.txt"
while IFS= read -r var
do
	add_file="$var"
	if [[ $add_file = *"rar"* ]]; then
		add_file=${add_file:3}
		echo $add_file
		git add $add_file
		git commit -m 'update'
		git push
	fi
done < "$input"
