#!/usr/bin/perl
use strict;
use warnings;
use v5.14;

use Digest::MD5;

my $file_name =  shift @ARGV;

open(FILE, $file_name) or die "Can't open '$file_name': $!";
binmode(FILE);
   
say Digest::MD5->new->addfile(*FILE)->hexdigest;
