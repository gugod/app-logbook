package App::Logbook::Command::Add;
use v5.12;
use strict;
use warnings;

use base 'App::CLI::Command';

use UNIVERSAL::require;

use App::Logbook::DB;
use App::Logbook::CommandHelpers ':all';

my $format = "text";

sub options {
    ('format=s' => \$format)
}

use YAML::Any;
use List::MoreUtils qw(mesh);

sub run {
    my $entry_class = "App::Logbook::" . ucfirst( lc($format) );
    $entry_class->require or die "Unkonw logbook format: $format\n";
    my $dir = App::Logbook::DB->connect;

    my $obj = $entry_class->new(
	invoke_hash_editor({
	    mesh @{[$entry_class->meta->get_attribute_list]}, @{[]}
	})
    );

    my $scope = $dir->new_scope;
    $dir->store($obj);
    say "stored.";
}

1;
