package App::Logbook::Expense;
use Moose;
use DateTime;
use DateTime::Format::Natural;
use Text::Trim;

extends 'App::Logbook::Entry';

has amount   => ( isa => "Num", is => "rw", required => 1 );
has currency => ( isa => "Str", is => "rw", required => 1 );
has reason   => ( isa => "Str", is => "rw", required => 1 );
has date     => ( isa => "DateTime", is => "rw", required => 1 );

augment 'as_string' => sub {
    my $self = shift;
    return "[Expense] " .
	join(", ", $self->amount ." ". uc($self->currency), $self->date->ymd('/'), $self->reason);
};

1;
