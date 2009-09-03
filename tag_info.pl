#!/usr/bin/perl

# (jb) Juni 2009
use strict;
use Data::Dumper;

my $str_postfix=".JPG";
my $str_path;
my $str_nextname;
my $str_tag = "Comment";


# Status-Meldung ausgeben.
print "\n";
print "POSTFIX=".$str_postfix."\n\n";

# Tags fuer alle Dateien im Verzeichnis ausgeben.
while ($str_nextname = <*$str_postfix>) {


       
	my $str_command="exiftool -P -$str_tag ".$str_nextname;
	#print $str_command."\n\n";
	print "$str_nextname ";
	system($str_command);
}
