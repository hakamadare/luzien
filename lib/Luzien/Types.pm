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

class_type Point, { class => 'Luzien::Point' };

coerce Point,
  from HashRef,
  via {
    try {
      Luzien::Point->new( %{$_} )
    } catch {
      Luzien::Exception->new->throw;
    }
  };

subtype PointArrayRef,
  as ArrayRef[ Point ];

subtype PositiveInt,
  as Int,
  where { $_ > 0 },
  message { "Value must be greater than 0" };

__PACKAGE__->meta->make_immutable;
