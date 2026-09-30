fn main() {
    let mut ranges = Vec::<(u64,u64)>::new();

    for line in std::io::stdin().lines() {
        let l = line.expect("Error reading line");
        if l.trim().len() == 0 {
            break;
        }

        let mut range = l.split("-");
        let a: u64 = range.next().unwrap().parse().unwrap();
        let b: u64 = range.next().unwrap().parse().unwrap();
        ranges.push((a, b));
    }
    ranges.sort();


    // Merge all ranges that overlap
    let mut new_ranges = Vec::<(u64,u64)>::new();
    let mut curr_range: (u64, u64) = *ranges.iter().next().unwrap();

    for (new_a, new_b) in ranges {
        let (prev_a, prev_b) = curr_range;

        // new_a >= prev_a bc it's sorted
        if new_b <= prev_b {
            continue; // NEW is contained in PREV
        } else { // new_b > prev_b
            if new_a <= prev_b {
                curr_range = (prev_a, new_b); // NEW begins inside PREV and ends after
            } else {
                new_ranges.push(curr_range); // NEW begins and ends after PREV
                curr_range = (new_a, new_b);
            }
        }
    }
    new_ranges.push(curr_range);

    let mut n_fresh: u64 = 0;
    for (a, b) in new_ranges {
        n_fresh += b - a + 1;
    }

    println!("{}", n_fresh);
}
