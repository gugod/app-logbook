package App::Logbook::Text;

use Moose;
use DateTime;

use overload
    '""' => \&as_string;

has content => ( isa => "Str", is => "rw", require => 1 );

has created_at => (
    isa => "DateTime",
    is => "ro",
    default => sub { DateTime->now }
);

has created_by => (
    isa => "Str",
    is  => "rw",
    default => '(unknown)'
);

sub as_string {
    my ($self, @args) = @_;
    
    my $dt = $self->created_at;
    my $t = $dt ? $dt->iso8601 : "(unknown time)";
    return $self->created_by . ", $t: " . $self->content;
    
}

1;
