#!/usr/bin/perl

@fields = ('byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'); #, 'cid');
@valid_records = 0;
open(FH, '<', 'input') or die $!;

undef $/;
@lines = split('\n\n', <FH>);

for $line (@lines) {
    @l = split(/ |\n/, $line);
    @present_fields = ();

    foreach (@l) {
        @tmp = split(':', $_);
        push(@present_fields, @tmp[0]);
    }

    $ok = 1;
    foreach (@fields) {
        if (not $_ ~~ @present_fields) {
            $ok = 0;
        }
    }
    if ($ok) {
        $valid_records++;
    }
}

print $valid_records;
close FH;
