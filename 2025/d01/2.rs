fn main() {
    let mut cursor: i32 = 50;
    let mut zeroes: i32 = 0;

    for line in std::io::stdin().lines() {
        let l: String = line.expect("A valid line");
        let dir: char = l.chars().nth(0).expect("Yolo");
        let n: i32 = (&l)[1..].trim().parse().expect("dfsada");
        print!("{}", cursor);
        let z1 = zeroes;

        if dir == 'R' {
            cursor += n;
            print!(" -(+{})-> ", n);
        } else {
            cursor -= n;
            print!(" -(-{})-> ", n);
        }

        if cursor > 99 {
            zeroes += cursor / 100;
            cursor = cursor % 100;
        } else if cursor <= 0 {
            if cursor != -n {
                zeroes += 1;
            }
            zeroes += (-cursor) / 100;
            cursor = cursor.rem_euclid(100);
        }

        println!("{}, z +{}", cursor, zeroes-z1);
        assert!(cursor >= 0 && cursor <= 99);
    }

    println!("Zero crosses: {}", zeroes);
}