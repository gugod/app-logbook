package App::Logbook::Command::Help;

use base 'App::CLI::Command';
use self;

sub run {
    print <<USAGE;

Hi, how are you?

USAGE
    
}

1;

