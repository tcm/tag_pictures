#!/usr/bin/perl
use strict;
use warnings;

use Digest::MD5;

my $file_name =  shift @ARGV;

open(FILE, $file_name) or die "Can't open '$file_name': $!";
binmode(FILE);
   
print Digest::MD5->new->addfile(*FILE)->hexdigest."\n";
