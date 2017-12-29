#!/usr/bin/perl
use strict;
use warnings;

$| = 1;
for ( 1 .. 100 )
{
    long_operation( $_ );
    spin_here($_); # Spin here
}
sub long_operation
{
    my $arg = shift;
    print "Processing element $arg\n" unless $arg % 15;
    sleep 1;
}
sub spin_here
{
  print $_ % 4 == 1 ? '-' 
      : $_ % 4 == 2 ? '\\'
      : $_ % 4 == 3 ? '|'
      :               '/';
   print "\r";
}
