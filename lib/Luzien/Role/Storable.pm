# ABSTRACT: Make objects storable
use Modern::Perl qw( 2014 );
package Luzien::Role::Storable;
use Moose::Role;
use MooseX::Types::Moose qw( Str );
use namespace::autoclean -except => 'meta';

with qw( KiokuDB::Role::ID KiokuDB::Role::UUIDs );

has 'id' => ( 
  is         => 'ro',
  isa        => Str,
  required   => 0,
  lazy_build => 1,
);

sub _build_id {
  my $self = shift;
  return $self->generate_uuid;
}

sub kiokudb_object_id {
  my $self = shift;
  return $self->id;
}

no Moose::Role;
1;
