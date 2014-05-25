use Modern::Perl qw( 2014 );
package Luzien::Point;
use Moose;
use MooseX::Types::DateTime qw( DateTime );
use namespace::autoclean;

use Luzien::Types qw( PositiveInt );

extends 'Luzien::Base';

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
