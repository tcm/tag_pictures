#!/usr/bin/perl

# (jb) September 2009
use strict;
use Data::Dumper;

my $str_tag = "Comment";
my $str_command;
my $str_filename;

foreach (@ARGV) {

        $str_filename = $_;
	###################################################
	# Tags fuer alle Dateien im Verzeichnis ausgeben.
	###################################################
	$str_command="exiftool -P -$str_tag $_";
	#print $str_command."\n\n";
	system($str_command);
}
