#!/usr/bin/perl

use strict;
use warnings;

my $arg = shift;

my $file = $arg eq "-c" ? shift : $arg;

open my $fh, '<', $file or die "Couldn't read file: $!\n";

read $fh, my $buffer, 16;
while( $buffer ) {
#    printf "0x%02X\t", unpack("%C", $_) foreach split //, $buffer;  
#    print unpack("%C", $_), "\t", foreach split //, $buffer;
#    print "$_\t", foreach split //, $buffer;
    foreach (split //, $buffer) {
	my $octal = unpack( "%C", $_);
	$arg eq "-c" && $octal >= 040 && $octal <= 0176? print "$_\t": printf "0x%02X\t", $octal;

    }   
    print "\n";
    read $fh, $buffer, 16;
}
