#!usr/bin/perl
# THis code is for counting the instances of AU and FAU in medline format results from pubmed
# retrieved on 10/03/2014.

open FH1, "<results_for_counting.txt" or die $!;
open FH2, ">Author_list_with_count.txt" or die $!;

my @pub = <FH1>;
#print "HI";
foreach my $line (@pub){
my @foo = split('\t', $line);
my @foo1 = ();
	foreach my $bar(@foo){
	my $count = 0;
		if($bar =~ /^AU.*|^FAU.*/ ){
		open FH, "<pubmed_result.txt" or die $!;	
			while ($fh = <FH>){
			chomp $fh;
				if ($fh =~ /^$bar/){
				$count++;
				}
			}
		}
	close FH;
	#print $count;
	push(@foo1, $bar.":".$count);
	}
print FH2 join("\t", @foo1);
#print $_."\n" foreach @foo1;
}

close (FH, FH1, FH2);