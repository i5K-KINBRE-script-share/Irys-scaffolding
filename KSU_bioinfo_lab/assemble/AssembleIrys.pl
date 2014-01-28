#!/bin/perl
##################################################################################
#   
#	USAGE: perl script.pl [options]
#
#  Created by jennifer shelton
#
##################################################################################
use strict;
use warnings;
# use List::Util qw(max);
# use List::Util qw(sum);
use File::Basename; # enable maipulating of the full path
use Getopt::Long;
use Pod::Usage;
##################################################################################
##############         Print informative message                ##################
##################################################################################
print "###########################################################\n";
print "#  AssembleIrys.pl                                        #\n";
print "#                                                         #\n";
print "#  Created by Jennifer Shelton 1/27/14                    #\n";
print "#  github.com/                                            #\n";
print "#  perl AssembleIrys.pl -help # for usage/options         #\n";
print "#  perl AssembleIrys.pl -man # for more details           #\n";
print "###########################################################\n";
#perl /Users/jennifershelton/Desktop/Perl_course_texts/scripts/Irys-scaffolding/KSU_bioinfo_lab/assemble/AssembleIrys.pl -g 230 -b test_bnx

##################################################################################
##############                get arguments                     ##################
##################################################################################
my ($bnx_dir,$genome,$reference);

my $man = 0;
my $help = 0;
GetOptions (
			  'help|?' => \$help, 
			  'man' => \$man,
			  'b|bnx_dir:s' => \$bnx_dir,    
              'g|genome:i' => \$genome,
              'r|ref:s' => \$reference  
              )  
or pod2usage(2);
pod2usage(1) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;
my $dirname = dirname(__FILE__);
my $T = 0.00001/$genome;
##################################################################################
##############                    split by scan                 ##################
##################################################################################
print "Spliting BNX by scan...\n";
my $split=`perl ${dirname}/split_by_scan.pl $bnx_dir`;
print "split";
##################################################################################
##############                        run                       ##################
##################################################################################
# ~/tools/RefAligner -if ${file_list} -o /dev/null -bnx -minsites 5 -minlen 150 -M 5
# ~/tools/RefAligner -i /home/irys/data/Merged_Molecule_Set/test.bnx -o /dev/null -bnx -minsites 5 -minlen 150 -M 5 -T ${T}
##################################################################################
##############                  Documentation                   ##################
##################################################################################
## style adapted from http://www.perlmonks.org/?node_id=489861 
__END__

=head1 NAME

script.pl - a package of scripts that ...

=head1 USAGE

perl script.pl [options]

 Documentation options:
   -help    brief help message
   -man	    full documentation
 Required options:
   -r	     reference CMAP
 Filtering options:
   --s_algn	 second minimum % of possible alignment   
   
=head1 OPTIONS

=over 8

=item B<-help>

Print a brief help message and exits.

=item B<-man>

Prints the more detailed manual page with output details and examples and exits.

=item B<-r, --r_cmap>

The reference CMAP produced by IrysView when you create an XMAP. It can be found in the "Imports" folder within a workspace.

=item B<--f_algn, --sa>

The minimum percent of the full potential length of the alignment allowed for the second round of filtering. This should be higher than the setting for the first round of filtering.

=back

=head1 DESCRIPTION

B<OUTPUT DETAILS:>

This appears when the manual is viewed!!!!

B<Test with sample datasets:>


perl script.pl -r sample_data/sample.r.cmap --s_algn .9

=cut