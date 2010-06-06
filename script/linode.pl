#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use CMS::Lite::Runner;

CMS::Lite::Runner->parse_options(@ARGV)->run;

