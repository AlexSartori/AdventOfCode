fn main() {
    let mut rows: Vec<Vec<u64>> = Vec::new();
    let mut ops: Vec<char> = Vec::new();
    
    for line in std::io::stdin().lines() {
        let l = line.expect("gah");
        let is_last = l.starts_with(&['+', '*']);
        let pieces = l.split_whitespace();

        if is_last {
            ops = pieces.map(|c| c.chars().next().expect("arghh")).collect();
        } else {
            let row = pieces.map(|p| p.parse::<u64>().unwrap());
            rows.push(row.collect());
        }
    }

    let mut grand_total = 0u64;

    for idx in 0..ops.len() {
        let col = rows.iter().map(|r| r[idx]);

        if ops[idx] == '+' {
            grand_total += col.reduce(|acc, x| acc + x).unwrap() as u64;
        } else if ops[idx] == '*' {
            grand_total += col.reduce(|acc, x| acc * x).unwrap() as u64;
        } else {
            panic!("Vez")
        }
    }

    println!("{}", grand_total);
}