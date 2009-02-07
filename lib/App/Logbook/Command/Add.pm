package App::Logbook::Command::Add;
use strict;
use warnings;
use feature ':5.10';

use base 'App::CLI::Command';

use App::Logbook::DB;
use UNIVERSAL::require;

use self;

my $format = "text";

sub options {(
    'format=s' => \$format,
)}

sub run {
    my $dir = App::Logbook::DB->connect;
    my $scope = $dir->new_scope;

    my $entry_class = "App::Logbook::" . ucfirst( lc($format) );
    $entry_class->require or die "Unkonw logbook format: $format\n";

    my $obj = $entry_class->new( content => join(" ", @args) );
    $dir->store($obj);

    say "... stored";
}

1;
