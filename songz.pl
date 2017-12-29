#!/usr/bin/perl
use strict;
use warnings;

my $file_input = @ARGV;

while( defined (my $line = <>) ) 
{
    
   my @line_split = split ':', $line;
   my $file_name = join '-', @line_split[0..1];
   my $file_content = join ':', @line_split[2..$#line_split];
 
   open my $fh, '>', $file_name;
   print $fh $file_content;
   close $fh;

}
