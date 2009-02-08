package App::Logbook::DB;
use strict;
use warnings;

use KiokuDB;
use File::Path qw(make_path);

sub connect {
    unless (defined $ENV{HOME}) {
	die "logbook can't work without \$HOME.";
    }

    unless (-d "$ENV{HOME}/.logbook/") {
	warn "Will create dir: $ENV{HOME}/.logbook/\n";
	make_path("$ENV{HOME}/.logbook/");
    }

    return KiokuDB->connect(
	"dbi:SQLite:dbname=$ENV{HOME}/.logbook/logbook.db",
	create => 1
    );
}

1;
