#!/usr/bin/perl -w

if(@ARGV)
{
    @file_list = @ARGV; # get the file list from the command arguments
    @file_list = glob("@file_list"); # expand any wildcards to include all valid files
}
else
{
    print("ERROR: no args\n");
    exit 1;
}

#@remove_list;

print("Enter 'y' to select the file to remove.\n");
print("Enter 'q' to quit file prompt.\n");
print("Enter anything else to skip file.\n");

foreach(@file_list)
{
    
    if (-d $_) #if directory file
    {
        print("Delete? [y,q] Directory: $_\n");
    }
    else #if regular file
    {
        print("Delete? [y,q] File: $_\n");
    }

    $input = <STDIN>;
    
    if($input eq "q\n" or $input eq "Q\n")
    {
        last; #break
    }
    if($input eq "y\n" or $input eq "Y\n")
    {
        push(@remove_list, $_);
    }
}

print "\n\n\nFILES TO REMOVE: \n";
#iterate through the indexes, so the indexes can be printed w/o a separate counter
for my $i (0 .. $#remove_list)
{
    print "[$i]: $remove_list[$i]\n";
}


print "Perform all deletions? [y]: ";
$input = <STDIN>;

if($input eq "y\n" or $input eq "Y\n")
{
    print "DELETION RESULTS:\n";
    #iterate through the indexes, so the indexes can be printed w/o a separate counter
    for my $i (0 .. $#remove_list)
    {
        if (-d $remove_list[$i]) #directory
        {
            rmdir("$remove_list[$i]");
            if (-d $remove_list[$i]) #If the foler still exists, it wasn't empty
            {
                print("  [$i]: $remove_list[$i] is not empty, cannot delete.\n");
            }
            else
            {
                print("  [$i]: $remove_list[$i] deleted.\n");
            }
        }
        else #file
        {
            unlink("$remove_list[$i]");
            print("  [$i]: $remove_list[$i] deleted.\n");
        }
        
    }
}
else
{
    print("Nothing has been deleted.\n");
}

exit 0;