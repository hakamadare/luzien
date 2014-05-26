use Test::More;
use Test::Fatal;

use Luzien::DB;
use Luzien::Schema::Nap;

my $db = Luzien::DB->new( dsn => 'hash' );

isa_ok( $db, 'Luzien::DB' );
can_ok( $db, 'store' );

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

my $old_nap = Luzien::Schema::Nap->new( $good_points );

my $old_point = $old_nap->next_point;

isa_ok( $old_point, 'Luzien::Schema::Point' );

my $scope = $db->new_scope;

# my $uuid = $db->store( $nap );
my $uuid = $db->store( $point );

ok( $uuid, 'got a UUID' );

# my $new_nap = $db->lookup( $uuid );
my $new_point = $db->lookup( $uuid );

# isa_ok( $new_nap, 'Luzien::Schema::Nap' );
isa_ok( $new_point, 'Luzien::Schema::Point' );

done_testing();
