#!/usr/bin/perl

# (jb) Juni 2009

use strict;
use File::Find;
#use File::Spec::Functions;

my $str_postfix = ".JPG";
my $str_tag = "Comment";
my $str_nextname;
my $str_nextname_s;
my $str_command_output;
my $str_output_file = "tags_find.dat";
my $str_outpath;

@ARGV = qw(./testbilder) unless @ARGV; # Hier steht unser zu durchsuchendes
                                         # Verzeichnis.
			
# Ausgabe-File anlegen
open (OUT, ">$str_output_file") || die "$str_output_file konnte nicht angelegt werden.\n";

# Alle Verzeichnisse rekursiv nach Bild-Dateien durchsuchen
# und relativen Pfad, Dateiname und Tag in Textdatei speichern.
sub show_all {

 $str_nextname = $File::Find::name;
 
 if ($str_nextname =~ /$str_postfix/ ) {                                   # Unser(e) Suchmuster.
                                         # Filenamen ausgeben.
  	$str_command_output=`exiftool -P -$str_tag $str_nextname`;
	$str_nextname_s =$str_nextname;

	
	print "$str_nextname ";
	
	print "$str_command_output";
	print OUT "$str_nextname_s  $str_command_output\n";
	#system($str_command);  
 
 }                                                                      
}

find (\&show_all, @ARGV);
