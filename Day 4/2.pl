@fields = ('byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'); #, 'cid');
@valid_records = 0;
open(FH, '<', 'input') or die $!;

undef $/;
@lines = split('\n\n', <FH>);

for $line (@lines) {
    @validated_fields = (0, 0, 0, 0, 0, 0, 0);

    foreach (split(/ |\n/, $line)) {
        @l = split(':', $_);
        chomp(@l);

        if (@l[0] eq 'byr' and @l[1] >= 1920 and @l[1] <= 2002) {
            @validated_fields[0] = 1;
        } elsif (@l[0] eq 'iyr' and @l[1] >= 2010 and @l[1] <= 2020) {
            @validated_fields[1] = 1;
        } elsif (@l[0] eq 'eyr' and @l[1] >= 2020 and @l[1] <= 2030) {
            @validated_fields[2] = 1;
        } elsif (@l[0] eq 'hgt') {
            $unit = substr(@l[1], -2);
            $x = substr(@l[1], 0, -2);
            if ($unit eq 'cm' and $x >= 150 and $x <= 193) {
                @validated_fields[3] = 1;
            }
            if ($unit eq 'in' and $x >= 59 and $x <= 76) {
                @validated_fields[3] = 1;
            }
        } elsif (@l[0] eq 'hcl' and grep(/^#([0-9a-f]{6})$/, @l[1])) {
            @validated_fields[4] = 1;
        } elsif (@l[0] eq 'ecl' and grep(/^(amb|blu|brn|gry|grn|hzl|oth)$/, @l[1])) {
            @validated_fields[5] = 1;
        } elsif (@l[0] eq 'pid' and grep(/^([0-9]{9})$/, @l[1])) {
            @validated_fields[6] = 1;
        }
    }

    if (@validated_fields == grep { $_ eq 1 } @validated_fields) {
        $valid_records++;
    }
}

print "Valid passports:", $valid_records;
close FH;
