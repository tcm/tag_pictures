#!/usr/bin/perl

@ARGV = qw(/home/juergen/bilder/) unless @ARGV; # Hier steht unser zu durchsuchendes
                                                # Verzeichnis.
use File::Find;
use Digest::SHA1;


my $file_name;
my $file;



sub show_all {

 $file_name = $File::Find::name;
 
 if ($file_name =~ /\.(JPG|jpg)/) {         # Unser(e) Suchmuster.
   # print "$file_name, ";                    # Filenamen ausgeben.

   # $file = shift || $file_name;
   open(FILE, $file_name) or die "Can't open '$file_name': $!";
   binmode(FILE);
   
   print OUT "$file_name,  ".Digest::SHA1->new->addfile(*FILE)->hexdigest."\n";
 }                                                  
}


open (OUT, ">filelist_sha1_3.txt") || die "Die Datei konnte nicht zum Schreiben geoeffnet werden.\n";
find (\&show_all, @ARGV);
close(OUT);
