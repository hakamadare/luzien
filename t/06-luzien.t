use Test::More;
use Test::Fatal;

use Luzien;

my $user = { username => 'foo', password => 'bar' };
my $db = { dsn => 'hash' };

my $luzien = Luzien->new( user => $user, db => $db );

isa_ok( $luzien, 'Luzien' );

can_ok( $luzien, 'user' );
isa_ok( $luzien->user, 'Luzien::Schema::User' );
can_ok( $luzien, 'db' );
isa_ok( $luzien->db, 'Luzien::DB' );

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

can_ok( $luzien, 'add_nap' );

my $nap1 = $luzien->add_nap( $good_points );

isa_ok( $nap1, 'Luzien::Schema::Nap' );

my $id = $nap1->id;

diag( "id: $id" );

can_ok( $luzien, 'get_nap' );

my $nap2 = $luzien->get_nap( $id );

isa_ok( $nap2, 'Luzien::Schema::Nap' );

is_deeply( $nap1, $nap2 );

done_testing();
