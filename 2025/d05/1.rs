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

    let mut n_fresh = 0u64;

    for line in std::io::stdin().lines() {
        let id: u64 = line.expect("Error reading line").parse().unwrap();

        for (a, b) in &ranges {
            if id >= *a && id <= *b {
                n_fresh += 1;
                break;
            }
        }
    }

    println!("{}", n_fresh);
}
