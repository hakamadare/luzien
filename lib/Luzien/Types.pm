# ABSTRACT: Custom types for Luzien
use Modern::Perl qw( 2014 );
package Luzien::Types;
use Moose;
use MooseX::Types -declare => [
  qw(
  Point
  PointArrayRef
  PositiveInt
  )
];
use MooseX::Types::Moose qw( Int ArrayRef HashRef );
use namespace::autoclean;

use Luzien::Exception::InvalidPoint;

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

__PACKAGE__->meta->make_immutable;
