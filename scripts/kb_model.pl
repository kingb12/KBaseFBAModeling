#!/usr/bin/perl 
use strict;
use warnings;
use Bio::KBase::fbaModel::CLI;
my $serv = Bio::KBase::fbaModel::CLI->new("http://kbase.us/services/fbaModelCLI");

my @args = @ARGV;
unshift "model", @args;
my $stdin;
if ( ! -t STDIN ) {
    local $/;
    $stdin = <STDIN>;
}
my ($status, $stdout, $stderr) = $serv->execute_command(\@args, $stdin);
print STDERR $stderr;
print STDOUT $stdout;
exit($status);
