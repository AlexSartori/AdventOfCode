
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
    let str_l = num_str.len();

    for win_size in factorize(str_l) {
        let mut has_pattern = true;

        for i in (win_size..str_l).step_by(win_size) {
            if num_str[0..win_size] != num_str[i..(i+win_size)] {
                has_pattern = false;
                break;
            }
        }

        if has_pattern {
            return true;
        }
    }

    return false;
}

fn factorize(num: usize) -> Vec<usize> {
    let mut factors = Vec::<usize>::new();
    
    for n in 1..=(num/2) {
        if (num % n) == 0 {
            factors.push(n);
        }
    }

    return factors;
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