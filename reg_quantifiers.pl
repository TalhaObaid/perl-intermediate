#!/usr/bin/perl

use strict;
use warnings;

while ( defined( my $line = <DATA> ) )
{
    chomp $line;
    print "'$line' contains a zip code\n"
        if $line =~ s/\d{}/*****/;
    print "'$line' contains an air ticket locator\n"
        if $line =~ s/[A-HJ-NP-Z2-9]{6}/*****/;
    print "'$line' contains a floating point number\n"
        if $line =~ s/\d+\.\d+/*****/;
    print "'$line' contains an IP adderss\n"
        if $line =~ s/\d{1,3}\.d{1,3\.\d{1,3}\.\d{1,3}/*****/;
    print "'$line' contains fruit\n"
        if $line =~ s/\d+\s+apples?.*\d+\s+bananas?/*****/;
}

__END__
Not a float by this standard: 12.
neither is this: .34
But this is: 12.34
O'Reilly School of Technology, Sebastopol, CA 95472
My reservation is N2QVYX
www.oreillyschoolc.om is at 63.171.219.89
Not an IP address: 12.123.1234.12
Not a valid reservation code: ABC10I
I have 1 apple and 12 bananas
