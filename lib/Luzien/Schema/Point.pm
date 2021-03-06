# ABSTRACT: A data point from a Nap
use Modern::Perl qw( 2014 );
package Luzien::Schema::Point;
use Moose;
use MooseX::Types::DateTimeX qw( DateTime );
use namespace::autoclean;

use Luzien::Types qw( PositiveInt );

extends 'Luzien::Schema';

with 'Luzien::Role::Storable';

has 'datetime' => (
  is  => 'ro',
  isa => DateTime,
  coerce => 1,
);

has 'value' => (
  is  => 'ro',
  isa => PositiveInt,
);

__PACKAGE__->meta->make_immutable;
