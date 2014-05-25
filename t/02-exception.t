use Test::More;
use Test::Fatal;

use Luzien::Exception::InvalidPoint;

my $invalidpoint = Luzien::Exception::InvalidPoint->new;

isa_ok( $invalidpoint, 'Luzien::Exception::InvalidPoint' );

isa_ok(
  exception { $invalidpoint->throw },
  'Luzien::Exception::InvalidPoint',
  'throwable exception',
);

done_testing();
