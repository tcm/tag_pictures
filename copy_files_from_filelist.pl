#!/usr/bin/perl

use File::Find;


my $file_pattern  ="XIMG_0832.JPG";



open (IN, "/home/juergen/projects/foto_dvd/leute/filelist.txt") 
|| die "Die Datei konnte nicht zum Lesen geoeffnet werden.\n";
        
while ( <IN> ) {

	$file_pattern = $_;
        chop($file_pattern);
	find (\&show_pics, '/home/juergen/bilder' );
} 
close(IN);



# find (\&show_pics, '/home/juergen/bilder' );


exit 0;


sub show_pics {
        my $file_name = $File::Find::name;
       
	/$file_pattern/s && print("$file_name\n");

        #	/^IMG_2683\.JPG\z/s && print("$filename\n");
	#	/^XIMG_1343\.JPG\z/s && print("$filename\n");
}
