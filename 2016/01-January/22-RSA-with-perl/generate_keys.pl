use warnings;
use strict;

use Math::BigInt;

if (@ARGV < 2) {
  die "generate_keys.pl prim-1  prim-2";
}

my $p   = new Math::BigInt($ARGV[0]);
my $q   = new Math::BigInt($ARGV[1]);

my $e   = new Math::BigInt(65537); # Public exponent

my $n   = $p * $q;
my $phi = ($p-1) * ($q-1);

if ($e >= $phi) {
  die;
}

my $d   = modular_inverse ($e, $phi);

print "\npublic key\n";
print "  e = $e\n";
print "  n = $n\n";

print "\nprivate key\n";
print "  d = $d\n";
print "  n = $n\n";


sub extended_eucledian_algorithm {
  # https://en.wikibooks.org/wiki/Algorithm_Implementation/Mathematics/Extended_Euclidean_algorithm
  # http://southernpacificreview.com/2014/01/06/rsa-key-generation-example

  my $a = shift;
  my $b = shift;

  my $x = 0;
  my $y = 1;
  my $u = 1;
  my $v = 0;

  while ($a) {

    my $q = int($b / $a);
    my $r =     $b % $a;

    my $m = $x - $u*$q;
    my $n = $y - $v*$q;

   ($b, $a, $x, $y, $u, $v) = ($a, $r, $u, $v, $m, $n);

  }

  return ($b, $x, $y);

}

sub modular_inverse {

  my $a = shift;
  my $m = shift;

 (my $g, my $x, my $y) = extended_eucledian_algorithm($a, $m);

  if ($g != 1) {
    print "modular_inverse does not exist\n";
    return undef; # Modular inverse does not exist
  }

  return $x % $m;

}
