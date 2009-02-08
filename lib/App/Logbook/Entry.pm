package App::Logbook::Entry;
use Moose;
use DateTime;

has created_at => (
    isa => "DateTime",
    is => "ro",
    default => sub { DateTime->now }
);

has created_by => (
    isa => "Str",
    is  => "rw",
    default => sub { $ENV{USER} || '(unknown)' }
);

use overload
    '""' => \&as_string;

use self;

sub as_string {
    my $dt = $self->created_at;
    my $t = $dt ? $dt->ymd("/") . " " . $dt->hms : "(unknown time)";
    return $self->created_by . ", $t: " . inner();
}

1;
