package App::Logbook::Command::Read;
use strict;
use warnings;
use feature ':5.10';

use base 'App::CLI::Command';
use App::Logbook::DB;

sub run {
    my $dir = App::Logbook::DB->connect;
    $dir->scan( sub { say $_[0] } );
}

1;

