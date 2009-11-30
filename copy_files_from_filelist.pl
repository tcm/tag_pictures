#!/usr/bin/perl

@ARGV = qw(/home/juergen/bilder/) unless @ARGV; # Hier steht unser zu durchsuchendes
                                                # Verzeichnis.
use File::Find;


my $file_name;
my $muster;


sub show_all {

 $file_name = $File::Find::name;


$muster = chop($zeile);
 if ($file_name =~ /$muster/) {           # Unser(e) Suchmuster.
   print "$file_name\n";                  # Filenamen ausgeben.

 }                                                  
}


open (IN, "filelist.txt") || die "Die Datei konnte nicht zum Lesen geoeffnet werden.\n";
while ( <IN> ) {

        $zeile = $_;
        #print "$zeile"; 
	find (\&show_all, @ARGV);
}

close(IN);
