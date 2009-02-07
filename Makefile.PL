use inc::Module::Install;
name 'App-Logbook';
all_from 'lib/App/Logbook.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
