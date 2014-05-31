use Test::More;
use Test::Fatal;

use Luzien::DB;
use Luzien::Schema::Nap;
use Luzien::Schema::Point;

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

my $scope = $db->new_scope;

my $old_nap = $db->add_nap( $good_points );

isa_ok( $old_nap, 'Luzien::Schema::Nap' );

my $id = $old_nap->id;

undef $scope;

$scope = $db->new_scope;

my $new_nap = $db->lookup( $id );

isa_ok( $new_nap, 'Luzien::Schema::Nap' );

is_deeply( $new_nap, $old_nap );

done_testing();
