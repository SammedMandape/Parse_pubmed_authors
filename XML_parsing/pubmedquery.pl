#! usr/bin/perl

open FH, "AuthorList_AU_FAU_pubmedquery.txt";
open FH1, ">Pubmedlinks.txt";

while (my $line = <FH>){
chomp $line;
my (@AU, @FAU);
my @authors = split('\t', $line);
#print @authors."\n";
#print scalar(@authors),"\n";
for(my $i=0;$i<scalar(@authors);$i++){
#print $i."\n";
if($authors[$i] =~ /^\bAU\b\s-\s(.*)/){
#print $1."\n";
#$AU.$i = $1;
push (@AU, $1);
}elsif($authors[$i] =~ /^\bFAU\b\s-\s(.*)/){
push (@FAU, $1);
}
}

$lenAU = scalar(@AU);
$lenFAU = scalar(@FAU);
my $firstAU = $AU[0];
#print $AU[0]."\t".$firstAU."\n";

my $link;
#print $lenFAU."\n\n";
for($i=0;$i<$lenFAU;$i++){
$FAU[$i] =~ s/\s/%20/g;
$FAU[$i] =~ s/,/%2C/g;
$link = $link.$FAU[$i]."%5BAuthor%20-%20Full%5D+OR+";
}

#print $link."\n\n";


my $lastele;
my @AUnew;
$AU[0] =~ s/\s/%20/g;
$AU[0] =~ s/,/%2C/g;
my $AUlink = "(Meharry%5BAffiliation%5D+AND+".$AU[0]."%5BAuthor%5D";
if($lenAU==1){
$AUlink = $AUlink.")"; 
}else{
@AUnew = @AU;
$lastele = pop(@AUnew);
$lastele =~ s/\s/%20/g;
$lastele =~ s/,/%2C/g;
}

my $newlenAU = scalar(@AUnew);
#print $newlenAU."\n\n";
if($newlenAU == 1){
$AUlink = $AUlink."+OR+".$lastele."%5BAuthor%5D)";
}elsif($newlenAU>1){
for($i=1;$i<$newlenAU;$i++){
$AUnew[$i] =~ s/\s/%20/g;
$AUnew[$i] =~ s/,/%2C/g;
$AUlink = $AUlink."+OR+".$AUnew[$i]."%5BAuthor%5D";
}
$AUlink = $AUlink."+OR+".$lastele."%5BAuthor%5D)";
}
#print $AUlink."\n\n";
print FH1 $firstAU."\t"."http://www.ncbi.nlm.nih.gov/pubmed/?term=".$link.$AUlink."\n";
}


