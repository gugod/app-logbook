use inc::Module::Install;
name 'App-Logbook';
all_from 'lib/App/Logbook.pm';
version '0.00_1';

requires
    'App::CLI'			   => 0,
    'App::CLI::Command'		   => 0,
    'DateTime'			   => 0,
    'DateTime::Format::Natural'	   => 0,
    'File::Path'                   => 0,
    'KiokuDB'			   => 0.57,
    'KiokuDB::Backend::DBI'	   => 1.23,
    'Moose'			   => 2,
    'Proc::InvokeEditor'	   => 0,
    'Text::Trim'		   => 0,
    'UNIVERSAL::require'	   => 0,
    'YAML::Any'			   => 0;

tests 't/*.t';
author_tests 'xt';

install_script "bin/logbook";

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
