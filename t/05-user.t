use Test::More;
use Test::Fatal;

use KiokuX::User::Util qw( crypt_password );

use Luzien::Schema::User;

my $good_username = 'captainkidd';
my $good_password = 'as_i_sailed';

my $user = Luzien::Schema::User->new(
  id       => $good_username,
  password => crypt_password( $good_password ),
);

isa_ok( $user, 'Luzien::Schema::User' );

can_ok( $user, 'id' );
can_ok( $user, 'password' );
can_ok( $user, 'check_password' );
can_ok( $user, 'kiokudb_object_id' );

is( $user->id, $good_username );
ok( $user->check_password( $good_password ) );

done_testing();
