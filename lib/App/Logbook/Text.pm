package App::Logbook::Text;
use Moose;

extends 'App::Logbook::Entry';

has content => ( isa => "Str", is => "rw", require => 1 );

augment 'as_string' => sub {
    my $self = shift;
    return $self->content;
};

1;
