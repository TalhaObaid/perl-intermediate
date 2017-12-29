#!/usr/bin/perl

use strict;
use warnings;

die "No arguments" if @ARGV == 0;

my $min_chars = shift @ARGV;
my $file = shift @ARGV;

my %count;

open my $fh, '<', $file;

while( my $_ = <$fh> )
{
    my @words = split;
    foreach (@words)
    {
        $count{$_}++ if length $_ >= $min_chars;
    }
}
print "$_: $count{$_}\n" foreach sort keys %count;