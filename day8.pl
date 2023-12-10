#!/usr/local/bin/perl

use strict;
use warnings;
use feature qw(say);
use Time::HiRes qw(time);
use Data::Dumper qw(Dumper);
use Math::Prime::Util qw(lcm);

my($t0,$t1,$t2)=(time,0,0);

my ($k,@i,@r,%x,@c,@e) = ( 0, map { $_ eq 'L' ? 0 : 1 } <> =~ m{([LR])}g );
my %r       = map { m{(\w+).*?(\w+).*?(\w+)} ? ( $1 => [$2,$3] ) : () } <>;
my @K = keys %r;
@x{@K} = 0 .. $#K;
@r[ map{$x{$_}} @K ] = map { [ $x{$r{$_}[0]}, $x{$r{$_}[1]} ] } @K;

my @l = map { $x{$_} } grep { m{..A} } @K;
#print Dumper(\@l);exit;
@e[ map { m{..Z} ? $x{$_} : () } keys @K ] = 0 .. $#K;
my $z = $x{'ZZZ'};

my $c = 0;
while( @l ) {
  @l = grep {
    $e[ $_->[1] = $r[$_->[1]][$i[$k]] ] ? ( $z == $_ && ($t1=$c), push @c,$c ) * 0 : 1
  } @l;
  $k++;$c++;
  $k%=@i;
}

$t2 = lcm @c;

printf "%16s %16s %15.9f\n", $t1, $t2, time-$t0;

