#!/usr/bin/perl

use strict;
use File::Basename;
use Getopt::Std;

my %options=();
getopts("o:",\%options);
# like the shell getopt, "d:" means d takes an argument
print "-o $options{o}\n" if defined $options{o};
print "Unprocessed by Getopt::Std:\n" if $ARGV[0];
#foreach (@ARGV) {
#  print "$_\n";
#}

my $str_path = $options{o};
my $str_filepattern = "IMG*.JPG";
my $str_pattern = $str_path.$str_filepattern;
my $file;
my $filename;
my $opt_s;
my $opt_n;



    my @files = glob($str_pattern);

    foreach my $file (@files) {

        
	$filename = basename($file);
	 
	print "$file --> X$filename\n";
	rename ($file, $str_path."X".$filename);

    }

    exit 0;


    
