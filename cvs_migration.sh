#!/bin/bash
for dir in /tmp/cvs/*
do for project in "$dir"/*;
	do
		module=`echo "$project" | awk -F'/' {'print $5'}`;
		### skip conversion of CVSROOT directory
		if [ $module == "CVSROOT" ]
		then
			continue
		fi
		replacement="${dir}\/${module}/"
		sed -e "s@cvsmodule@$replacement@" /tmp/cvs2svn-2.5.0/cvs2git-example.options > /tmp/cvs2svn-2.5.0/cvs2git-example_module.options
		/tmp/cvs2svn-2.5.0/cvs2git --options=/tmp/cvs2svn-2.5.0/cvs2git-example_module.options;
		cd /tmp/git/;
		git init --bare $module.git;
		cd $module.git;
		cat /tmp/cvs2svn-2.5.0/cvs2git-tmp/git-blob.dat /tmp/cvs2svn-2.5.0/cvs2git-tmp/git-dump.dat | git fast-import;
		git gc --prune=now;
	done
done
cd /tmp/git/;
tar -czvf converted_repos.tar.gz *;
