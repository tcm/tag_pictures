#!/usr/bin/perl

use File::Find;



sub show_pics;

find (\&show_pics, '/home/juergen/bilder' );


exit 0;


sub show_pics {
        my $filename = $File::Find::name;
        
        #open (IN, "/home/juergen/projects/foto_dvd/leute/filelist.txt") || die "Die Datei konnte nicht zum Lesen geoeffnet werden.\n";
        
        #while ( <IN> ) {
        
		#/^$_\z/s && print("$filename\n");

		/^IMG_2683\.JPG\z/s && print("$filename\n");
		/^XIMG_1343\.JPG\z/s && print("$filename\n");
	#}
 	#close(IN);
}
