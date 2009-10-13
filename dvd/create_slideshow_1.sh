#!/bin/bash

VERZ=/home/juergen/dvd_project/slideshow_1
TITEL=Betzenstein

dir2slideshow -p -n "$TITEL" -t 8 -c 2 -a 1.ogg -b 1.jpg $VERZ  

dvd-slideshow  -f $TITEL.txt 
