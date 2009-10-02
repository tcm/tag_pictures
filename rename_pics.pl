use strict;
use File::Basename;
use File::Spec;
use File::Glob ':glob';


my @files;
my $str_filepattern = "IMG*.JPG";
my $str_path;
my $str_path2;

my $file;
my $filename_alt;
my $filename_neu;


foreach (@ARGV) {

    $str_path = File::Spec->catfile( $_, $str_filepattern );
    print "$str_path\n\n";

    @files = bsd_glob "$str_path";

    foreach my $file (@files) {
	    #print "$file\n";

	    $filename_alt = basename($file);
	    $filename_neu = "X".$filename_alt;
	    $str_path2 = File::Spec->catfile( $_, $filename_neu );

            print "$filename_alt --> $filename_neu\n";

	    rename ($file, $str_path2);

    }
}
exit 0;


    

