#!/usr/bin/perl

use strict;
use warnings;

my $directive;
my %allow;
my %deny;

while( <> ) {
    chomp;
    if( /\Aorder (allow\,deny|deny\,allow)\z/ )
    {
	if( $directive )
	{
	    warn "Multiple ORDER directives\n";
	}
	$directive = $1;
    }
    elsif( /\A(allow|deny) from (.*)\z/ ) 
    {
	if( $1 eq 'allow' ) {$allow{$2} = 1;}
	elsif ( $1 eq 'deny' ) { $deny{$2} = 1;}

    }
}

die "No order directive in input" unless( $directive );

print "Input address to test: ";
while( <STDIN> )
{
    chomp;
    exit if /\Aquit\z/;

    if ($directive eq "allow,deny")
    {
	if( match( \%allow, $_ ) )
	{
	    if( match( \%deny, $_ ) ) 
	    {
		print "REJECTED\n";
	    }
	    else 
	    {
		print "ALLOWED\n";
	    }
	}
	else 
	{
	    print "REJECTED\n";
	}
    }
    elsif ($directive eq "deny,allow")
    {
	if ( match( \%deny, $_ ) )
	{
	    if ( match( \%allow, $_ ) )
	    {
		print "ALLOWED\n";
	    }
	    else 
	    {
		print "REJECTED\n";
	    }	
	}
	elsif ( match( \%allow, $_ ) ) 
	{
	    print "ALLOWED\n";
	}
	else 
	{
	    print "ALLOWED\n";
	}

    }

    print "Input address to test: ";
}

sub match
{

    my %hash = %{ shift @_ };
    my $target = shift @_;   

    if( $target =~ /\d+/ ){
	
	foreach my $h( keys %hash ) {

	    if( $target =~ /\A$h/ ) {
		return 1;
	    }
	}
	return 0;
    } elsif ( $target =~ /[a-z]+/ ) {
	
	foreach my $h( keys %hash ) {
	    if( $target =~ /$h\z/ ) {
		return 1;
	    }
	}
	return 0;
    }
    return 0;
}
