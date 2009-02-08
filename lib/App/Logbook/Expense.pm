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

override 'BUILDARGS' => sub {
    my ($self, @args) = @_;

    return super() if @args > 1;

    my $str = $args[0];
    my @matched = split /,+/, $str, 3;

    die "Don't understand: $str\n"
	if @matched != 3;

    die "Don't understand: $str\n"
	unless ($matched[0] =~ /^(\d+)\s*(\w+)?/);

    return {
	amount => $1,
	currency => $2 || "USD",
	date => DateTime::Format::Natural->new->parse_datetime( $matched[1] ),
	reason => trim($matched[2])
    }
};

1;
