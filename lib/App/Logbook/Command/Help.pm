package App::Logbook::Command::Help;
use v5.12;
use strict;
use warnings;

use base 'App::CLI::Command';

sub run {
    print <<USAGE;

Hi, how are you?

USAGE
    
}

1;

