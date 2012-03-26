use inc::Module::Install;

name     'Object-Nano';
all_from 'lib/Object/Nano.pm';
author   q{Brad Haywood <brad@perlpowered.com>};
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

