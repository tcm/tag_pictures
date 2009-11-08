#!/usr/bin/perl

# (jb) September 2009
use strict;
use FindBin '$Bin';
use File::Spec;

my $str_tag="Testtag";
my $int_tag_id;
my $int_i;
my $str_tag_file;
my @arr1= ();
my $item;
my $str_command;
my $taste;
my $output;
my $s1;
my $s2;
my $s3;
my $line;

########################################
# Einlesen der Text-Tags aus einem File.
########################################
$str_tag_file=File::Spec->catfile($Bin, "tags.txt");

print "Tag:\n";
open(IN, $str_tag_file) || die "$str_tag_file kann nicht gelesen werden.\n";
while (<IN>) {
	chop;
	push (@arr1, $_);
}

########################
# Ausgabe der Text-Tags.
########################
$int_i = 0;
foreach $item (@arr1) {
	print $int_i.") $item\n";
  	$int_i++;
}
print "99) Comment-Tag löschen\n";

########################
# Auswahl des Text-Tags.
########################
print "Tag: ";
$int_tag_id = <STDIN>;

###############################
# Bei 99 Sonderfall, alle
# Comment-Tags löschen.
##############################
if ($int_tag_id  == "99") {
        foreach ( @ARGV ) {
		$str_tag = "";
        	$str_command="exiftool -P -comment=\"".$str_tag."\" ".$_;
        	print $str_command."\n\n";
        	system($str_command);
        }
        exit 0;
} else {
        # Andernfalls den Tag aus dem File nehmen.
	$str_tag = $arr1[$int_tag_id];
}

foreach ( @ARGV )  {
	#############################################################
	# Tag auslesen und zwischenspeichern.
        # Anschliessend anhaengen, wenn schon ein Tag existiert.
	#############################################################
 	$output=`exiftool -P -p \'TAG,\$FileName,\$Comment'  $_`;

        if (-f $_) {                                          # File?
                print "$output";
                ($s1,$s2,$s3) = split(/,/,$output);           # Tag von Comment und Filename trennen.
                if ($s3) {                                    # Nur anhaengen, wenn Comment schon was enthaelt.
 			$str_tag = $s3.";".$str_tag;
		}
        }
        if (-d $_) {                                           # Verzeichnis?
                print "$output";
                @arr1 = split(/\n/,$output);                   # Einzelzeilen der Ausgabe
                foreach $line (@arr1) {                        # in Array speichern.
                      if ($line  =~ /^TAG/) {
                                ($s1,$s2,$s3) = split(/,/,$line);
                      }
		      if ($s3) {                           # Nur anhaengen, wenn Comment schon was enthaelt.
                      		$str_tag = $s3.";".$str_tag;
                      }
		}
        }
	##############################################################
	# Kommando-Zeile zum Schreiben zusammensetzen.
	##############################################################
	$str_command="exiftool -P -comment=\"".$str_tag."\" ".$_;
	print $str_command."\n\n";
	system($str_command);
}
$taste = <STDIN>;
exit 0;
