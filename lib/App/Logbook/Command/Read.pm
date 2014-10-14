package App::Logbook::Command::Read;
use v5.12;
use strict;
use warnings;

use base 'App::CLI::Command';
use App::Logbook::DB;

sub run {
    my $dir = App::Logbook::DB->connect;
    $dir->scan( sub { say $_[0]->as_string } );
}

1;

