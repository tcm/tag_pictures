#!/usr/bin/perl

@ARGV = qw(/home/juergen/bilder/) unless @ARGV; # Hier steht unser zu durchsuchendes
                                           # Verzeichnis.
use File::Find;

my $file_name;
my $sum;
my $file_name_ziel;

sub show_all {

 $file_name = $File::Find::name;
 
 if ($file_name =~ /\.JPG_original/) {         # Unser(e) Suchmuster.
   print "$file_name\n";                   # Filenamen ausgeben.
   $file_name_ziel = $file_name;   

  #$file_name_ziel =~ s#.*/##;            # Pfadangaben abschneiden.
  #$file_name_ziel =~ s/flv/avi/;         
  #print "$file_name_ziel\n"; 

  system("rm $file_name");

  #$sum += -s;                                         
 }                                                  
}

find (\&show_all, @ARGV);

#print "$sum Bytes\n"; 

