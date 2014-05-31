use Test::More;
use Test::Fatal;

use Luzien::Schema::Nap;

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
  user => {
    username => 'foo',
    password => 'bar',
  },
};

my $bad_points = {
  points => [
    [ 'slim', 'shady', ],
    [ 'mighty', 'quinn', ],
  ],
};

$nap = Luzien::Schema::Nap->new( $good_points );

isa_ok( $nap, 'Luzien::Schema::Nap' );

can_ok( $nap, 'points' );
can_ok( $nap, 'timezone' );
can_ok( $nap, 'nap_start' );
can_ok( $nap, 'nap_end' );
can_ok( $nap, 'alarm_start' );
can_ok( $nap, 'alarm_end' );

is( $nap->size, scalar( @{$good_points->{'points'}} ) );

my $point = $nap->next_point;

isa_ok( $point, 'Luzien::Schema::Point' );

is( $nap->size, scalar( @{$good_points->{'points'}} ) - 1 );

isa_ok(
  exception { Luzien::Schema::Nap->new( $bad_points ) },
  'Moose::Exception::ValidationFailedForInlineTypeConstraint',
  'throws exception on invalid points',
);

done_testing();
