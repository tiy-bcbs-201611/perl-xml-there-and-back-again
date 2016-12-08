#!/usr/bin/env perl
use warnings;
use strict;
use XML::Generator;

my $X = XML::Generator->new(':pretty');

print $X->playlist(
  $X->movie({"id" => "tt0112384"},
    $X->title("Apollo 13"),
    $X->director("Ron Howard"),
    $X->empty(),
    $X->cast(
      $X->person({
        "name" => "Tom Hanks",
        "role" => "Jim Lovell"
      }),
      $X->person({
        "name" => "Bill Paxton",
        "role" => "Fred Haise"
      }),
    )
  )
);
