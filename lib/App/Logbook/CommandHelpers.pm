package App::Logbook::CommandHelpers;
use strict;
use warnings;

use Sub::Exporter -setup => {
    exports => [ qw(invoke_hash_editor) ]
};

use YAML::Any qw(Dump Load);
use Proc::InvokeEditor;

sub invoke_hash_editor {
    my ($hash) = @_;
    my $text = Proc::InvokeEditor->edit( Dump($hash) );
    warn $text;
    return Load( $text );
}

1;

    
