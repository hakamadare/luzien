use Test::More;
use Test::Fatal;

use Luzien::Point;

my $point;

my $good_datetimestr = '20:44';
my $good_pointval = '1561';

my $good_point = {
  datetime => $good_datetimestr,
  value => $good_pointval,
};

my $bad_datetimestr = 'i am not a parseable time';
my $bad_pointval = '-1';

my $bad_datetime_point = {
  datetime => $bad_datetimestr,
  value => $good_pointval,
};

my $bad_value_point = {
  datetime => $good_datetimestr,
  value => $bad_pointval,
};

$point = Luzien::Point->new( $good_point );

isa_ok( $point, 'Luzien::Point' );

can_ok( $point, 'datetime' );
can_ok( $point, 'value' );

isa_ok( $point->datetime, 'DateTime' );
is( $point->value, '1561' );

isa_ok(
  exception { Luzien::Point->new( $bad_datetime_point ) },
  'Moose::Exception::ValidationFailedForInlineTypeConstraint',
  'throws exception on invalid datetime',
);

isa_ok(
  exception { Luzien::Point->new( $bad_value_point ) },
  'Moose::Exception::ValidationFailedForInlineTypeConstraint',
  'throws exception on invalid datetime',
);

done_testing();
