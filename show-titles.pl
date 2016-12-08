#!/usr/bin/perl
use strict;
use warnings;
use XML::LibXML;

my $filename = 'playlist.xml';
my $dom = XML::LibXML->load_xml(location => $filename);

my @titles = $dom->findnodes('/playlist/movie/title');
print("I found ", scalar(@titles), " movies.\n");

sub replaceText {
  my $dom = shift @_;
  my $node = shift @_;
  my $text = shift @_;

  my $new_text_node = $dom->createTextNode($text);
  $node->firstChild->replaceNode($new_text_node);
}

foreach my $title (@titles) {
  print($title->to_literal(), "\n");

  # Replace the content of the <title></title>
  # tag with "(REDACTED)"
  # my $new_text_node = $dom->createTextNode("(REDACTED)");
  # $title->firstChild->replaceNode($new_text_node);
  replaceText($dom, $title, "(REDACTED)");

  print($title->findvalue("."), "\n"); # This is the "same" as to_literal()
}

open(my $fh, ">", "modified.xml");
print($fh $dom);
close($fh);
