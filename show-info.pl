#!/usr/bin/perl
use strict;
use warnings;
use XML::LibXML;

my $filename = 'playlist.xml';
my $dom = XML::LibXML->load_xml(location => $filename);

foreach my $movie ($dom->findnodes('//movie')) {
  print('Id:       ', $movie->findvalue('./@id'), "\n");
  print('Title:    ', $movie->findvalue('./title'), "\n");
  print('Director: ', $movie->findvalue('./director'), "\n");
  print('Rating:   ', $movie->findvalue('./mpaa-rating'), "\n");
  print('Duration: ', $movie->findvalue('./running-time'), " minutes", "\n");
  print("Cast:\n");
  foreach my $person ($movie->findnodes('./cast/person')) {
    print("  ", $person->findvalue('./@name'), " as ", $person->findvalue('./@role'), "\n");
  }
  print("\n");
}
