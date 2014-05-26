# ABSTRACT: Make objects storable
use Modern::Perl qw( 2014 );
package Luzien::Role::Storable;
use Moose::Role;
use MooseX::Types::Moose qw( Str );
use namespace::autoclean -except => 'meta';

with qw( KiokuDB::Role::ID KiokuDB::Role::UUIDs );

has 'id' => (
  is => 'ro',
  isa => Str,
  required => 0,
);

sub kiokudb_object_id {
  my $self = shift;
  return $self->id ||= shift->KiokuDB::Role::UUIDs::generate_uuid;
}

no Moose::Role;
1;
