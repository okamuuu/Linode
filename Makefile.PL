use inc::Module::Install;

name     'CMS-Lite';
all_from 'lib/CMS/Lite.pm';
author   'okamura <okamuuuuu@gmail.com>';
license  'perl';

build_requires 'Test::More';
requires 'YAML::Tiny';


auto_install;

WriteAll;

