package App::Logbook::Entry;
use Moose;

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

1;

