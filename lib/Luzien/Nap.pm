# ABSTRACT: An array of Points with metadata
use Modern::Perl qw( 2014 );
package Luzien::Nap;
use Moose;
use MooseX::Types::DateTime::ButMaintained qw( TimeZone );
use MooseX::Types::DateTimeX qw( DateTime );
use namespace::autoclean;

use Luzien::Types qw( PointArrayRef );
use Luzien::Point;

extends 'Luzien::Base';

has 'points' => (
  is  => 'rw',
  isa => PointArrayRef,
  coerce => 1,
  lazy => 1,
  default => sub { [] },
);

has 'timezone' => (
  is  => 'rw',
  isa => TimeZone,
  coerce => 1,
  lazy => 1,
  default => sub { DateTime::TimeZone->new( name => 'floating' ) },
);

has 'nap_start' => (
  is  => 'rw',
  isa => DateTime,
  coerce => 1,
  lazy => 1,
  default => sub { DateTimeX::Easy->new( 'yesterday' ) },
);

has 'nap_end' => (
  is  => 'rw',
  isa => DateTime,
  coerce => 1,
  lazy => 1,
  default => sub { DateTimeX::Easy->new( 'today' ) },
);

has 'alarm_start' => (
  is  => 'rw',
  isa => DateTime,
  coerce => 1,
  lazy => 1,
  default => sub { DateTimeX::Easy->new( 'today' ) },
);

has 'alarm_end' => (
  is  => 'rw',
  isa => DateTime,
  coerce => 1,
  lazy => 1,
  default => sub { DateTimeX::Easy->new( 'today' ) },
);

__PACKAGE__->meta->make_immutable;
