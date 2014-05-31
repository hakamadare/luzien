# ABSTRACT: data archive for Morpheuz
#
use Modern::Perl qw( 2014 );
package Luzien;
use Moose;
use namespace::autoclean;

use Luzien::Types qw( DB User );

use Luzien::DB;
use Luzien::Schema::Nap;
use Luzien::Schema::User;

has 'db' => (
  is => 'ro',
  isa => DB,
  coerce => 1,
);

has 'user' => (
  is => 'ro',
  isa => User,
  coerce => 1,
);

has 'scope' => (
  is => 'rw',
  default => undef,
);

sub new_scope {
  my $self = shift;
  $self->scope( $self->db->new_scope );
  return $self->scope;
};

sub add_nap {
  my $self = shift;
  $self->scope or $self->new_scope;
  return $self->db->add_nap( @_ );
};

sub get_nap {
  my $self = shift;
  $self->scope or $self->new_scope;
  return->$self->db->lookup( @_ );
};

__PACKAGE__->meta->make_immutable;
