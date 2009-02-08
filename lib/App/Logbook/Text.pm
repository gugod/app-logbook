package App::Logbook::Text;
use Moose;

extends 'App::Logbook::Entry';

has content => ( isa => "Str", is => "rw", require => 1 );

augment 'as_string' => sub {
    my $self = shift;
    return $self->content;
};

override 'BUILDARGS' => sub {
    my ($self, @args) = @_;

    return super() if @args > 1;

    my $str = $args[0];
    return { content => $str };
};

1;
