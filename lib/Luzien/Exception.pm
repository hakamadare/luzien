use Modern::Perl qw( 2014 );
package Luzien::Exception;
use Moose;
use MooseX::StrictConstructor;
use namespace::autoclean;

extends 'Moose::Exception';

with qw( Throwable StackTrace::Auto );

__PACKAGE__->meta->make_immutable;
