use inc::Module::Install;
name 'App-Logbook';
all_from 'lib/App/Logbook.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

requires
    'App::CLI'			=> 0,
    'DateTime'			=> 0,
    'DateTime::Format::Natural' => 0,
    'KiokuDB'			=> 0,
    'Moose'			=> 0,
    'Text::Trim'		=> 0,
    'UNIVERSAL::require'	=> 0,
    'self'			=> 0;

install_script "bin/logbook";

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
