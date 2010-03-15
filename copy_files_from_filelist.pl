#!/usr/bin/perl

use File::Find;
use File::Copy;

my $line;
my $file_pattern;
my $piclist_file = "/home/juergen/projects/foto_dvd/jahreszeiten/filelist.txt";
my $destination_dir = "/home/juergen/projects/foto_dvd/jahreszeiten/";


# Liste mit Files einlesen.
# In jeder Zeile steht ein Filename.
#####################################
open (IN, $piclist_file) 
|| die "Die Datei konnte nicht zum Lesen geoeffnet werden.\n";
        
while ( <IN> ) {

	$line = $_;
        chop($line);                   # Newline abschneiden.
        $file_pattern = qr/^$line\z/s; # Regex compilieren.
        #print "$file_pattern\n";

	find (\&show_pics, '/home/juergen/bilder' );
} 
close(IN);




exit 0;


sub show_pics {
        my $file_name = $File::Find::name; # Filename komplett mit Pfad.
       
	if ( $_ =~ $file_pattern ) { # Nur den Filennamen mit dem Regex vergleichen.
          print"$file_name\n";
          copy($file_name,$destination_dir);
	};
         
        # Erzeugt mit find2perl /home/juergen/bilder -name "XIMG_1343.JPG"       
	# /^XIMG_1343\.JPG\z/s && print("$file_name\n");
}
