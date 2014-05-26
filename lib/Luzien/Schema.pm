# ABSTRACT: Base class for other Luzien data classes
use Modern::Perl qw( 2014 );
package Luzien::Schema;
use Moose;
use MooseX::StrictConstructor;
use Carp;
use namespace::autoclean;

__PACKAGE__->meta->make_immutable;
