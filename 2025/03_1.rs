fn activate_bank(cells: String) -> i32 {
    let mut max_cell: char = '0';
    let mut max_cell_2: char = '0';

    for (i, c) in cells.chars().enumerate() {
        if c > max_cell && i < cells.len() - 1 {
            max_cell = c;
            max_cell_2 = '0';
        } else if c > max_cell_2 {
            max_cell_2 = c;
        }
    }

    (max_cell as i32 - '0' as i32) * 10 + (max_cell_2 as i32 - '0' as i32)
}

fn main() {
    let mut s: i32 = 0;

    for line in std::io::stdin().lines() {
        s += activate_bank(line.unwrap());
    }
    
    println!("{}", s);
}