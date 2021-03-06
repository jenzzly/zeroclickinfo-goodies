#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => 'rand';
zci is_cached => 0;

ddg_goodie_test(
    [qw( DDG::Goodie::RandomNumber )],
    'random number between 12 and 45' => test_zci(
        qr/\d{2} \(random number\)/,
        structured_answer => {
            input     => [12, 45],
            operation => 'Random number between',
            result    => qr/^\d{2}$/
        }
    ),
    'random number' => test_zci(qr/\d{1}\.\d+ \(random number\)/,
        structured_answer => {
            input     => [0, 1],
            operation => 'Random number between',
            result    => qr/\d{1}\.\d+/,
        }
    ),
    'random number between 0 and 1' => test_zci(
        qr/\d{1} \(random number\)/,
        structured_answer => {
            input => [0, 1],
            operation => 'Random number between',
            result => qr/^\d{1}\.\d+$/
        }
    ),
    'random number between 0 and 10' => test_zci(
        qr/\d{1,2} \(random number\)/,
        structured_answer => {
            input => [0, 10],
            operation => 'Random number between',
            result => qr/^\d{1,2}$/
        }
    ),
    'random number between 0 and 100' => test_zci(
        qr/\d{1,3} \(random number\)/,
        structured_answer => {
            input => [0, 100],
            operation => 'Random number between',
            result => qr/^\d{1,3}$/
        }
    ),
    'random day'    => undef,
    'random access' => undef,
);
done_testing
