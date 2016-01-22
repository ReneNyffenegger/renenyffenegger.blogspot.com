use warnings;
use strict;
use Math::BigInt;

if (@ARGV < 3) {
  die "encrypt_decrypt.pl public|private-key n message";
}

my $e = new Math::BigInt($ARGV[0]);
my $n = new Math::BigInt($ARGV[1]);
my $m = new Math::BigInt($ARGV[2]);

my $c = modular_exponation($m, $e, $n); # ($m ** $e) % $n;

print "\n$c\n";

sub modular_exponation { # https://en.wikipedia.org/wiki/Modular_exponentiation

  my $base = shift;
  my $exp  = shift;
  my $mod  = shift;

  my $c = new Math::BigInt(1);
  my $e = new Math::BigInt(0);

  while ($e < $exp) {
    $c = ($base * $c) % $mod;
    $e ++;
  }

  return $c;
}

