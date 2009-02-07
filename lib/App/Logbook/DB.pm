package App::Logbook::DB;
use strict;
use warnings;

use KiokuDB;

sub connect {
    my $dir = KiokuDB->connect(
	"dbi:SQLite:dbname=$ENV{HOME}/.logbook/db",
	create => 1
    );

    return $dir;
}

1;

