# (jb) Juni 2009
use strict;
use Data::Dumper;

my $str_prefix="IMG_";
my $str_postfix=".jpg";
my $str_path;
my $str_tag="Testtag";
my $int_tag_id;
my $int_count1;
my $int_count2;
my $int_i;
my $str_int_i;
my $str_tag_file = "tags.txt";
my @arr1= ();
my $item;

# Eingabe Bildzaehl-Interval
print "Count1: ";
$int_count1 = <STDIN>;
chop($int_count1);

print "Count2: ";
$int_count2 = <STDIN>;
chop($int_count2);

# Einlesen der Text-Tags aus einem File.
print "Tag:\n";
open(IN, $str_tag_file) || die "$str_tag_file kann nicht gelesen werden.\n";
while (<IN>) {
  chop;
  push (@arr1, $_);
}

# Ausgabe der Text-Tags.
$int_i = 0;
foreach $item (@arr1) {
  print $int_i.") $item\n";
  $int_i++;
}
#print Dumper @arr1;

# Auswahl des Text-Tags.
print "Tag: ";
$int_tag_id = <STDIN>;
$str_tag = $arr1[$int_tag_id];

print "\n$str_tag";

# Status-Meldung ausgeben.
print "\n";
print "PREFIX=".$str_prefix."  POSTFIX=".$str_postfix."\n";

# Kommando-Zeile zusammensetzen und so oft ausfuehren, wie der Interval vorgibt.
for ( $int_i = $int_count1; $int_i <= $int_count2 ; $int_i++ ) { 

	# my $str_command="exiftool -overwrite_orginal -o %f.%e -P -comment=\"".$str_tag."\" ".$str_prefix.$int_i.$str_postfix;
        $str_int_i = substr("00".$int_i,-4,4);	
	my $str_command="exiftool -P -comment=\"".$str_tag."\" ".$str_prefix.$str_int_i.$str_postfix;
	print $str_command."\n\n";
	system($str_command);
}
