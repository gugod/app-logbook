package App::Logbook::Command::Text;
use strict;
use warnings;
use feature ':5.10';

use base 'App::CLI::Command';

use App::Logbook::DB;
use App::Logbook::Text;

use self;

sub run {
    my $dir = App::Logbook::DB->connect;
    my $scope = $dir->new_scope;

    my $obj = App::Logbook::Text->new( content => join(" ", @args) );
    $dir->store($obj);

    say "... stored";
}

1;
