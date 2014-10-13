package App::Logbook::Command::Help;

use base 'App::CLI::Command';

sub run {
    print <<USAGE;

Hi, how are you?

USAGE
    
}

1;

