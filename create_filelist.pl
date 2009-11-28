#!/usr/bin/perl

use strict;
use File::Basename;


open(OUT, ">filelist.txt") || die "Datei konnte nicht zum Schreiben geoeffnet werden.\n";

my @all_files = <"/media/Daten-CD_DVD\ \(08/foto_dvd/klettern/*">;

foreach my $file (@all_files) {
	print OUT basename($file)."\n";

}
close(OUT);
