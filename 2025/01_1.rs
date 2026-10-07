fn main() {
    let mut cursor: i32 = 50;
    let mut zeroes: i32 = 0;
    
    for line in std::io::stdin().lines() {
        let l: String = line.expect("A valid line");
        let dir: char = l.chars().nth(0).expect("Yolo");
        let n: i32 = (&l)[1..].trim().parse().expect("dfsada");
        println!("Dir: {}, N: {}", dir, n);

        if dir == 'R' {
            cursor += n;
            if cursor > 99 {
                cursor %= 100;
            }
        } else {
            cursor -= n;
            if cursor < 0 {
                cursor %= 100;
            }
        }

        if cursor == 0 {
            zeroes += 1;
        }
    }

    println!("Zero crosses: {}", zeroes);
}