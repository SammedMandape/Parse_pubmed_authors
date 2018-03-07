#! usr/bin/perl
#use regex "debug";
open FH, "<Clinical_faculty.txt" || die "Can't open the file: $!\n";
open FH2, ">Results.txt" || die "Can't open MMC pubmed: $!\n";

@som = <FH>;
foreach my $som1(@som){
chomp $som1;
#$som2 = qw($som1);
print FH2 $som1;

open FH1, "<MMC_pubmed_authors_FAU_AU.txt" || die "Can't open MMC pubmed: $!\n";
while (my $line = <FH1>){
chomp $line;
#print $som1;
#print $line."\n";
if ($line =~ m/\b$som1\b/i){
print FH2 "\t".$line;
}
}
close FH1;
print FH2 "\n";
}

#close FH1;