package App::Logbook::Text;
use DateTime;
use Moose;

extends 'App::Logbook::Entry';

has content => ( isa => "Str", is => "rw", require => 1 );

use overload
    '""' => \&as_string;

use self;

sub as_string {
    my $dt = $self->created_at;
    my $t = $dt ? $dt->iso8601 : "(unknown time)";
    return $self->created_by . ", $t: " . $self->content;    
}

1;
