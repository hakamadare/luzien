use Test::More;
use Test::Fatal;

use Luzien::Point;

my $point;

my $good_datetimehash = {
  year       => 2014,
  month      => 5,
  day        => 24,
  hour       => 7,
  minute     => 15,
  second     => 47,
  nanosecond => 500000000,
  time_zone  => 'America/New_York',
};
my $good_pointval = '1561';

my $good_point = {
  datetime => $good_datetimehash,
  value => $good_pointval,
};

my $bad_datetimehash = {
  bla  => 'de',
  bloo => 'bla',
};
my $bad_pointval = '-1';

my $bad_datetime_point = {
  datetime => $bad_datetimehash,
  value => $good_pointval,
};

my $bad_value_point = {
  datetime => $good_datetimehash,
  value => $bad_pointval,
};

$point = Luzien::Point->new( $good_point );

isa_ok( $point, 'Luzien::Point' );

can_ok( $point, 'datetime' );
can_ok( $point, 'value' );

isa_ok( $point->datetime, 'DateTime' );
is( $point->value, '1561' );

# isa_ok(
#   exception { Luzien::Point->new( $bad_datetime_point ) },
#   'Luzien::Exception::InvalidPoint',
#   'throws exception on invalid datetime',
# );
#
# isa_ok(
#   exception { Luzien::Point->new( $bad_value_point ) },
#   'Luzien::Exception::InvalidPoint',
#   'throws exception on invalid value',
# );

done_testing();
