# ABSTRACT: User objects for Luzien
use Modern::Perl qw( 2014 );
package Luzien::Schema::User;
use Moose;
use MooseX::Aliases;
use MooseX::StrictConstructor;
use MooseX::Types::Moose qw( Str );
use Carp;
use namespace::autoclean;

extends qw( Luzien::Schema );

with qw( KiokuX::User );

__PACKAGE__->meta->make_immutable;
