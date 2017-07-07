#!/bin/sh

echo "Starting to generate the static files"

hexo generate

echo "static files generated"

echo "Would you like to move the contents of public folder to blog folder in your krshubham.github.io repo (Y/n)?"

read domove

case "$domove" in
	"Y") echo "Moving the files...."
		cd ../krshubham.github.io/blog
		rm -rf **/*.*
		cd ../../personal-blog
		mv	./public/**/*.* ../krshubham.github.io/blog/
		echo "moved all the files 🤘🏻"
		cd ../krshubham.github.io/blog
		ls
		;;
	"n") echo "Thanks! Bye"
	;;
esac

