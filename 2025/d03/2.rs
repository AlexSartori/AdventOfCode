fn activate_bank(cells: String) -> u64 {
    let n = cells.len();
    let mut last_idx: i32 = -1;
    let mut digits: Vec<i32> = Vec::new();

    for _ in 0..12 {
        let begin_search: usize = (last_idx + 1) as usize;
        let end_search: usize = n - 12 + digits.len();
        let window: &str = &cells[begin_search..=end_search];

        let mut max_cell: char = '0';
        for (i, c) in window.chars().enumerate() {
            if c > max_cell {
                last_idx = (begin_search + i) as i32;
                max_cell = c;
            }
        }

        digits.push(max_cell as i32 - '0' as i32);
    }

    // println!("{} -> {:?}", cells, digits);

    let mut total: u64 = 0;
    for (i, d) in digits.iter().enumerate() {
        total += *d as u64 * 10_u64.pow(11 - i as u32);
    }
    total
}

fn main() {
    let mut s: u64 = 0;

    for line in std::io::stdin().lines() {
        s += activate_bank(line.unwrap());
    }
    
    println!("{}", s);
}