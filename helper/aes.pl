#!/usr/bin/perl
use strict;
use warnings;
use v5.14;

use Crypt::CBC;
use Crypt::Cipher::AES;

my $key = 'length16length16'; # length has to be valid key size for this cipher
my $iv = '1234567812345678';  # 16 bytes

my $cbc = Crypt::CBC->new( -cipher=>'Cipher::AES', -key=>$key, -iv=>$iv );
my $ciphertext = $cbc->encrypt("secret data");

say $ciphertext;
