#!/usr/bin/perl

use strict;
use warnings;

for ("aa" .. "zz") {
    open my $fh, '>', $_ or die "Couldn't open file $!\n";
    print {$fh} "\U$_\E";
    close $fh;
}

while( my $file = glob "*q*" )
{
    open my $fh, '<', $file;
    while (<$fh>) {
        chomp $_;
	print "$_\n";
    }
    unlink $file;
}

my @array = glob("??");
print $#array+1;
