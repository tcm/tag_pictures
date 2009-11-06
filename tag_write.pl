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
#print Dumper @arr1;

########################
# Auswahl des Text-Tags.
########################
print "Tag: ";
$int_tag_id = <STDIN>;
$str_tag = $arr1[$int_tag_id];

#print "\n$str_tag";

foreach ( @ARGV )  {


	################################################################################
	# Kommando-Zeile zusammensetzen.
	################################################################################
	$str_command="exiftool -P -comment=\"".$str_tag."\" ".$_;
	print $str_command."\n\n";
	system($str_command);
}
$taste = <STDIN>;
