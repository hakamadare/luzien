# Dancer app implementing Luzien RESTful API
package Luzien::Server;
use Dancer qw( :syntax :moose );
use Dancer::Plugin::REST;

prepare_serializer_for_format;

get '/' => sub {
    template 'index';
};

get '/api/nap/:id.:format' => sub {
    Luzien::DB->new->lookup( params->{id} );
};

true;
