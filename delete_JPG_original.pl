#!/usr/bin/perl

@ARGV = qw(/home/juergen/bilder/) unless @ARGV; # Hier steht unser zu durchsuchendes
                                                # Verzeichnis.
use File::Find;

my $file_name;
my $taste;

sub show_all {

 $file_name = $File::Find::name;
 
 if ($file_name =~ /\.JPG_original/) {         # Unser(e) Suchmuster.
   print "Deleted: $file_name\n";              # Filenamen ausgeben.

  unlink($file_name) || print "$file_name konnte nicht geloescht werden.\n";

 }                                                  
}

find (\&show_all, @ARGV);
print "Fertig!\n";
$taste = <STDIN>;
