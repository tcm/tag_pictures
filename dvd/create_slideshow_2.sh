#!/bin/bash

VERZ=/home/juergen/dvd_project/slideshow_2
TITEL=Festspielpark

dir2slideshow -p -n "$TITEL" -t 8 -c 2 -a 2.ogg -b 2.jpg $VERZ  

dvd-slideshow  -f $TITEL.txt 
