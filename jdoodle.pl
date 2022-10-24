# Orien Thongphay
# 10/24/2022
# This Project analyzes the Apache log files using a counter to trach local and remote requests
use strict;
use warnings;

#Filename is in variable and is opened or die
my $file = "/uploads/apache_access.log";
open my $fh, '<', $file or die "Could not open 'file': $!";

#Local and Remote ip is defined and goes over file line by line
my $local = 0;
my $remote = 0;
while (my $line = <$fh>) {
    
    #Input record separator, used to remove trailing newlines
    chomp $line;
    
    #Index returns where the ip address ends and is the same as the length of the ip address
    my $length = index ($line, " ");
    
    #Use substr to return the address at the beginning
    my $ip = substr($line, 0, $length);
    
    #Check if ip address is local or remote adding to their counter
    if ($ip eq "127.0.0.1") {
        $local++;
    }
    else {
        $remote++;
    }
}

print "Local: $local Remote: $remote\n";


