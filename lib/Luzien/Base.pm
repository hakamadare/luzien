use Modern::Perl qw( 2014 );
package Luzien::Base;
use Moose;
use MooseX::StrictConstructor;
use Carp;
use namespace::autoclean;

__PACKAGE__->meta->make_immutable;
