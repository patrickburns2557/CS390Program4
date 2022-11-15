#!/usr/bin/perl -w

if(@ARGV)
{
    @file_list = @ARGV;
    @file_list = glob("@file_list");
}
else
{
    print("ERROR: no args\n");
    exit 1;
}

foreach(@file_list)
{
    print("$_\n");
}
print "Perform all deletions? [y]: ";
$input = <STDIN>;
print "$input";

#delete



exit 0;