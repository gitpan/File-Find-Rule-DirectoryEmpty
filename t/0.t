use Test::Simple 'no_plan';
use strict;
use lib './lib';
use File::Find::Rule::DirectoryEmpty;
use Cwd;
use Smart::Comments '###';

mkdir cwd().'/t/emptyhere';


my @ed = File::Find::Rule::DirectoryEmpty->directoryempty->in(cwd.'/t');

ok(scalar @ed);


### @ed
