use Test::More;
use Test::Fatal;

use Luzien::Nap;

my $nap;

my $good_points = {
  points => [
    [ '00:55', '59', ],
    [ '01:05', '54', ],
    [ '01:15', '51', ],
    [ '01:25', '47', ],
    [ '01:35', '48', ],
    [ '01:45', '535', ],
    [ '01:55', '647', ],
    [ '02:05', '537', ],
    [ '02:15', '61', ],
    [ '02:25', '46', ],
    [ '02:35', '48', ],
    [ '02:45', '757', ],
    [ '02:55', '58', ],
    [ '03:05', '50', ],
    [ '03:15', '153', ],
  ],
};

my $bad_points = {
  points => [
    [ 'slim', 'shady', ],
    [ 'mighty', 'quinn', ],
  ],
};

$nap = Luzien::Nap->new( $good_points );

isa_ok( $nap, 'Luzien::Nap' );

can_ok( $nap, 'points' );
can_ok( $nap, 'timezone' );
can_ok( $nap, 'nap_start' );
can_ok( $nap, 'nap_end' );
can_ok( $nap, 'alarm_start' );
can_ok( $nap, 'alarm_end' );

isa_ok(
  exception { Luzien::Nap->new( $bad_points ) },
  'Moose::Exception::ValidationFailedForInlineTypeConstraint',
  'throws exception on invalid points',
);

done_testing();
