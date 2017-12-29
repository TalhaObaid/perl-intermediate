#!/usr/bin/perl

use strict;
use warnings;

my %protocol;
my %server;
while(<>)
{
    if(/(\w+)\:\/\/([\w\.]+)\//) {
	my $prtcl = $1;
	my $srvr = $2;

        unless ($protocol{$prtcl}) {$protocol{$prtcl} = 1;}
	else { $protocol{$prtcl}++;}
	unless ( $server{$srvr} ) { $server{$srvr} = 1;} 
	else {$server{$srvr}++;}
    }
}
 
for( (sort { $protocol{$b} <=> $protocol{$a} } keys %protocol) [0..1] ) {
    print "$_ $protocol{$_}\n";
}

for( (sort {$server{$b} <=> $server{$a} } keys %server) [0..1] ) {
    print "$_ $server{$_}\n";
}

