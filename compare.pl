#!/usr/bin/perl

use strict;

my $value1 = shift;
my $value2 = shift;

my @value1 = $value1 =~ /(\d+)/g;
my @value2 = $value2 =~ /(\d+)/g;

my $index = 0;

my @max = @value1;

while(1)
  {
  last
    if not defined $value1[$index];
    
  last
    if not defined $value2[$index];

  if($value1[$index] > $value2[$index])
    {
    @max = @value1;
    
    last;
    }
  elsif($value2[$index] > $value1[$index])
    {
    @max = @value2;
    
    last;
    }
  else
    {
    ++$index;
    
    next;
    }
  }
  
my $max = join('.', @max);

printf("Maximum of %s and %s is %s\n", $value1, $value2, $max);