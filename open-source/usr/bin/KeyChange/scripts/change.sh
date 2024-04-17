#!/bin/bash

if [ -z "$(setxkbmap -print | grep '+us+')" ]; then
	$(setxkbmap us)
	echo "cs > us" >> ../log
else
	$(setxkbmap cz)
	echo "us > cs" >> ../log
fi
