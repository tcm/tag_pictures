#!/usr/bin/perl

# (jb) September 2009
use strict;
use Data::Dumper;

my $str_tag = "Comment";
my $taste;
my $str_command;

#my $output;
#my $s1;
#my $s2;
#my $s3;
#my @arr1;
#my $line;

foreach (@ARGV) {

       
	###################################################
	# Tags fuer alle Dateien im Verzeichnis ausgeben.
	###################################################
        $str_command = "exiftool -P -p \'TAG,\$FileName,\$Comment'  $_";
        system($str_command);

	# Das geanderte Ausgabe-Format ermoeglicht eine bessere
        # Verarbeitung um den Tag nachtraeglich zu veraendern.
        # Muss noch in tag_write.pl integriert werden.
	#$output=`exiftool -P -p \'TAG,\$FileName,\$Comment'  $_`;
        #if (-f $_) {                                # File?
	 	#print "$output";
        #	($s1,$s2,$s3) = split(/,/,$output); # Tag von Comment und Filename trennen.
        #	print "$s2 -> $s3\n";
        #}
	# if (-d $_) {                                # Verzeichnis?
                #print "$output";
        #        @arr1 = split(/\n/,$output);         # Einzelzeilen der Ausgabe
        #        foreach $line (@arr1) {              # in Array speichern.
                	#print "$line\n";
	#		if ($line  =~ /^TAG/) {
	#			  ($s1,$s2,$s3) = split(/,/,$line);
        #                }

			
	#	}
        #	print "$s2 -> $s3\n";
        #}

}
$taste = <STDIN>;

