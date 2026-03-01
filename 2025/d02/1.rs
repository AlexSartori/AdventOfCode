
fn eval_range(range: &str) -> u64 {
    let mut it = range.split('-');
    let r1 = it.next().unwrap();
    let r2 = it.next().unwrap();
    println!("Range: {} - {}", r1, r2);
    
    let a: u64 = r1.parse().unwrap();
    let b: u64 = r2.parse().unwrap();
    let mut invalid_ids: u64 = 0;

    for n in a..=b {
        if eval_num(n) {
            println!("  > {} is an invalid ID", n);
            invalid_ids += n;
        }
    }

    return invalid_ids;
}

fn eval_num(num: u64) -> bool {
    let num_str: String = num.to_string();
    let h: usize = num_str.len() / 2;
    num_str[..h] == num_str[h..]
}

fn main() {
    let mut line = String::new();
    std::io::stdin().read_line(&mut line)
        .expect("stdin");

    let ranges = line.trim().split(',');
    let mut sum: u64 = 0;

    for r in ranges {
        sum += eval_range(r);
    }

    println!("Final sum: {}", sum);
}