# ABSTRACT: Invalid Point Exception
use Modern::Perl qw( 2014 );
package Luzien::Exception::InvalidPoint;
use Moose;
use MooseX::StrictConstructor;
use namespace::autoclean;

extends 'Luzien::Exception';

sub _build_message {
  my $self = shift;
  "Invalid point";
};

__PACKAGE__->meta->make_immutable;
