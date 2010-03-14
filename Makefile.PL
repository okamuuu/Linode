use inc::Module::Install;

name     'DancePod-Web';
all_from 'lib/DancePod/Web.pm';
author   'okamura <okamura@example.com>';
license  'perl';

build_requires 'Test::More';
requires 'Mouse';
requires 'String::CamelCase';
requires 'Plack::Request';
requires 'Plack::Server::Standalone';
requires 'YAML::XS';
requires 'HTTPx::Dispatcher';
requires 'Template::Plugin::XML::Escape;


auto_install;

WriteAll;

