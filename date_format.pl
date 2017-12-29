#!/usr/bin/perl

use strict;
use warnings;

my %month_lst = ("January" => 1, "February" => 2, "March" => 3, "April" => 4, "May" => 5, "June" => 6, "July" => 7, "August" => 8, "September" => 9, "October" => 10, "November" => 11, "December" => 12 );


while( my $line = <>)
{
	if ( $line =~ m{(.*)\s(\d{1,2})\,\s(\d\d\d\d)})
	{
	       

		my ($month, $day, $year) = ($1, $2, $3);
		
		foreach my $mn(keys %month_lst) {
		    if( $month =~ m[($mn\b)]) {
		
		        print "$year-$month_lst{$1}-$day\n";
			last;
		    }
		}
	}
}
