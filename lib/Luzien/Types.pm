# ABSTRACT: Custom types for Luzien
use Modern::Perl qw( 2014 );
package Luzien::Types;
use Moose;
use MooseX::Types -declare => [
  qw(
  Point
  PointArrayRef
  PositiveInt
  User
  DB
  )
];
use MooseX::Types::Moose qw( Undef Str Int ArrayRef HashRef );
use KiokuX::User::Util qw( crypt_password );
use namespace::autoclean;

class_type Point, { class => 'Luzien::Schema::Point' };

coerce Point,
  from HashRef,
  via { Luzien::Schema::Point->new( %{$_} ) },
  from ArrayRef,
  via { Luzien::Schema::Point->new( datetime => $_->[0], value => $_->[1], ) };

subtype PointArrayRef,
  as ArrayRef[ Point ];

coerce PointArrayRef,
  from ArrayRef,
  via {
    my $pointref = $_;
    my( @points ) = map { Luzien::Schema::Point->new( datetime => $_->[0], value => $_->[1], ) } @{$pointref};
    return \@points;
  };

subtype PositiveInt,
  as Int,
  where { $_ > 0 },
  message { "Value must be greater than 0" };

class_type User, { class => 'Luzien::Schema::User' };

coerce User,
  from HashRef,
  via { Luzien::Schema::User->new(
      id       => $_->{'username'},
      password => crypt_password( $_->{'password'} ),
  ) },
  from ArrayRef,
  via { Luzien::Schema::User->new(
      id       => $_->[0],
      password => crypt_password( $_->[1] ),
  ) };

class_type DB, { class => 'Luzien::DB' };

coerce DB,
  from Undef,
  via { Luzien::DB->new( dsn => 'hash' ) },
  from Str,
  via { Luzien::DB->new( dsn => $_ ) },
  from HashRef,
  via { Luzien::DB->new( %{$_} ) };

__PACKAGE__->meta->make_immutable;
