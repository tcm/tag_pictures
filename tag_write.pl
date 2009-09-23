#!/usr/bin/perl

# (jb) September 2009
use strict;
use Data::Dumper;

my $str_tag="Testtag";
my $int_tag_id;
my $int_i;
my $str_tag_file = "tags.txt";
my @arr1= ();
my $item;
my $str_command;
my $str_filename;

########################################
# Einlesen der Text-Tags aus einem File.
########################################
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
#print Dumper @arr1;

########################
# Auswahl des Text-Tags.
########################
print "Tag: ";
$int_tag_id = <STDIN>;
$str_tag = $arr1[$int_tag_id];

#print "\n$str_tag";

foreach ( @ARGV )  {
        $str_filename = $_;

	##########################
	# Status-Meldung ausgeben.
	##########################
	#print "$str_filename\n";

	################################################################################
	# Kommando-Zeile zusammensetzen und so oft ausfuehren, wie der Interval vorgibt.
	################################################################################
	$str_command="exiftool -P -comment=\"".$str_tag."\" ".$_;
	print $str_command."\n\n";
	system($str_command);
}
