# ABSTRACT: Luzien persistence layer
use Modern::Perl qw( 2014 );
package Luzien::DB;
use Moose;
use MooseX::StrictConstructor;
use Carp;
use namespace::autoclean;

extends 'KiokuX::Model';

sub store_nap {
  my( $self, $nap ) = @_;

  my $uuid = $self->txn_do(
    sub { $self->store( $nap ) }
  );

  return $uuid;
}

sub store_point {
  my( $self, $point ) = @_;

  my $uuid = $self->txn_do(
    sub { $self->store( $point ) }
  );

  return $uuid;
}

__PACKAGE__->meta->make_immutable;
