fn main() {
    let mut rows: Vec<Vec<char>> = Vec::new();
    
    for line in std::io::stdin().lines() {
        let l = line.expect("gah");
        rows.push(l.strip_suffix('\n').unwrap_or(&l).chars().collect());
    }

    let n_cols = rows[0].len();
    let mut terms = Vec::new();
    let mut grand_total = 0u64;
    let mut curr_op = '+';

    for idx in 0..n_cols {
        let mut num: u64 = 0;
        let mut all_spaces: bool = true;

        for row in rows.iter() {
            let c = row[idx];

            if c == ' ' {
                continue;
            } else {
                all_spaces = false;

                if c == '+' || c == '*' {
                    curr_op = c;
                } else {
                    let d: u64 = c.to_digit(10).unwrap().into();
                    num = num * 10 + d;
                }
            }
        }
        
        if !all_spaces {
            terms.push(num);
        }

        if all_spaces || idx == n_cols - 1 {
            if curr_op == '+' {
                grand_total += terms.into_iter().reduce(|acc, x| acc + x).unwrap() as u64;
            } else if curr_op == '*' {
                grand_total += terms.into_iter().reduce(|acc, x| acc * x).unwrap() as u64;
            } else {
                panic!("Vez")
            }
            terms = Vec::new();
        }
    }
    

    println!("{}", grand_total);
}