#!/usr/bin/perl
# USAGE: ./btoc.2.pl "name of extracted folder" > output file
use strict;
use warnings;
use File::Find;
use HTML::HeadParser;

my @l;

#print "Content-type: text/html\n\n";
print "<html><head>\n";
print "<title>CAST Rules</title>\n";
print "<link rel='StyleSheet' href='$ARGV[0]/style.css' type='text/css'>";
print "</head>\n";
print "<body>\n";

find( { wanted => \&wanted, follow => 1, preprocess => \&sortFiles }, $ARGV[0]);

@l = sort @l;
my ($k,$ftab,$ctab,$title,$num,$tab);
$ftab = 0;
while ($k = shift @l) {
	if ($k =~ /---/) {
		$k =~ s/---//g;
		$title = getHeader($k);
		$num = $k;
		$num =~ s/\/index//g;
		$num =~ s/^.+\///g;
		$num =~ s/\.htm[l]*$//g;
		$title = "(".$num.") ".$title;
		$ctab = 0;
	} else {
		$title = getHeader($k);
		$num = $k;
		$num =~ s/^.+\///g;
		$num =~ s/\.htm[l]*$//g;
		$title = "(MetricID ".$num.") ".$title;
		$ctab = 1;
	}
	$tab = $k =~ tr[/][];
	if ($ftab eq 0) {
		$ftab = $tab;
	}
	$tab -= $ftab - $ctab;
	printf "<p>%s<a href='%s'>%s</a></p>\n",
		"&nbsp;&nbsp;&nbsp;&nbsp;" x $tab,
		$k,
		$title;
}

print "</body></html>\n";

sub wanted {
	my $f = $File::Find::name;
	if ($f =~ /\.html$|\.htm$/) {
		$f =~ s/index\.htm[l]*$/---index\.htm/g;
		push @l, $f;
	}
	return;
}

sub getHeader {
	my $ff = shift;
	my $p = HTML::HeadParser->new;
	$p->parse_file($ff);
	return $p->header('Title');
}
