#! usr/bin/perl

open FH, "<pubmed_result_Meharry_Medical_College_Affiliation.txt" || die "Can't open: $!\n";
open Fh1, ">perl_results_output.txt";

while(my $line = <FH>){
chomp $line;
#print $line;
if($line =~ /^AU.*/  or $line =~ /^FAU.*/){
print Fh1 $line."\n";

}
}