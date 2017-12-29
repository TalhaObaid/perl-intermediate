#!/usr/bin/perl
use strict;
use warnings;
my $file = "songs.data";
open (my $fh, '<', $file) || (die $!);
print $fh;
close $fh;
