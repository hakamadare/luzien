# ABSTRACT: An array of Points with metadata
use Modern::Perl qw( 2014 );
package Luzien::Schema::Nap;
use Moose;
use MooseX::Types::DateTime::ButMaintained qw( TimeZone );
use MooseX::Types::DateTimeX qw( DateTime );
use namespace::autoclean;

use Luzien::Types qw( PointArrayRef User );
use Luzien::Schema::Point;
use Luzien::Schema::User;

extends 'Luzien::Schema';

with qw( Luzien::Role::Storable );

has 'user' => (
  is => 'ro',
  isa => User,
  coerce => 1,
);

has 'points' => (
  traits => ['Array'],
  is  => 'ro',
  isa => PointArrayRef,
  coerce => 1,
  lazy => 1,
  default => sub { [] },
  handles => {
    add_point => 'push',
    each => 'elements',
    empty => 'is_empty',
    next_point => 'shift',
    size => 'count',
  },
);

has 'timezone' => (
  is  => 'ro',
  isa => TimeZone,
  coerce => 1,
  lazy => 1,
  default => sub { DateTime::TimeZone->new( name => 'floating' ) },
);

has 'nap_start' => (
  is  => 'ro',
  isa => DateTime,
  coerce => 1,
  lazy => 1,
  default => sub { DateTimeX::Easy->new( 'yesterday' ) },
);

has 'nap_end' => (
  is  => 'ro',
  isa => DateTime,
  coerce => 1,
  lazy => 1,
  default => sub { DateTimeX::Easy->new( 'today' ) },
);

has 'alarm_start' => (
  is  => 'ro',
  isa => DateTime,
  coerce => 1,
  lazy => 1,
  default => sub { DateTimeX::Easy->new( 'today' ) },
);

has 'alarm_end' => (
  is  => 'ro',
  isa => DateTime,
  coerce => 1,
  lazy => 1,
  default => sub { DateTimeX::Easy->new( 'today' ) },
);

__PACKAGE__->meta->make_immutable;
