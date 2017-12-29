#!/usr/bin/perl

use strict;
use warnings;

my %artist_length;
while ( defined( my $line = <>))
{
    my @path_elem = split("/", $ARGV);
    my $artist = (split("-", $path_elem[-1]))[0];
    my @file_contents = split(':', $line);
    my $music_length = $file_contents[1];
    
    if( exists ( $artist_length{$artist} ) )
    {          
        $artist_length{$artist} += $music_length;
    }
    else 
    { 
        $artist_length{$artist} = $music_length;
    }
}    

for my $artist (keys %artist_length) {

    print $artist . " has a total of " . $artist_length{$artist}. " in music\n";
}
