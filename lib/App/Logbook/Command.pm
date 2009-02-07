package App::Logbook::Command;
use strict;
use warnings;

our $VERSION = '0.01';

use base 'App::CLI';

sub dispatch {
    my $class = shift;
    my $cmd = $class->prepare(@_);
    $cmd->subcommand;
    $cmd->run_command(@ARGV);
}

sub error_cmd {
    "Command not recognized, try $0 help.\n";
}

1;

