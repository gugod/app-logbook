package App::Logbook::DB;
use strict;
use warnings;

use KiokuDB;
use File::XDG;
use File::Path qw(make_path);
use File::Spec;

sub connect {
    my $xdg = File::XDG->new( name => "logbook" );

    my $data_home = $xdg->data_home;
    make_path($data_home, { verbose => 1, mode => 0700 }) unless -d $data_home;

    my $sqlite_path = File::Spec->catfile($data_home, "logbook.db");
    return KiokuDB->connect("dbi:SQLite:dbname=${sqlite_path}", create => 1);
}

1;
