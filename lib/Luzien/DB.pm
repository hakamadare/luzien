# ABSTRACT: Luzien persistence layer
use Modern::Perl qw( 2014 );
package Luzien::DB;
use Moose;
use MooseX::StrictConstructor;
use Carp;
use namespace::autoclean;

extends 'KiokuX::Model';

sub add_nap {
  my( $self, @args ) = @_;

  my $nap = Luzien::Schema::Nap->new( @args );

  $self->txn_do( sub {
      $self->insert( $nap );
    } );

  return $nap;
};

__PACKAGE__->meta->make_immutable;
