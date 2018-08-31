#!/bin/sh

lsof | perl -lane '$x{"$F[0]:$F[1]"}++;
END { print "$x{$_}\t$_" for sort {$x{$a}<=>$x{$b}} keys %x}'
