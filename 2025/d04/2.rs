fn check_roll(rows: &Vec<Vec<bool>>, y: usize, x: usize) -> bool {
    if !rows[y][x] {
        return false;
    }

    let mut adjacent = 0;

    for y_off in -1i32..=1i32 {
        if (y == 0 && y_off == -1) ||
           (y as i32 + y_off >= rows.len() as i32) {
            continue;
        }

        for x_off in -1i32..=1i32 {
            if (x == 0 && x_off == -1) ||
               (x as i32 + x_off >= rows[y].len() as i32) {
                continue;
            }

            if y_off == 0 && x_off == 0 {
                continue
            }

            if rows[(y as i32 + y_off) as usize][(x as i32 + x_off) as usize] {
                adjacent += 1;
            }
        }
    }

    return adjacent < 4;
}

fn main() {
    let mut rows = Vec::<Vec<bool>>::new();

    for line in std::io::stdin().lines() {
        let mut row = Vec::<bool>::new();
        for c in line.expect("Error reading line").trim().chars() {
            row.push(c == '@');
        }
        rows.push(row);
    }

    let h: usize = rows.len();
    let w: usize = rows[0].len();
    let mut moved: i32 = 0;
    let mut prev_moved = -1;

    while moved != prev_moved  {
        prev_moved = moved;
        
        for y in 0..h {
            for x in 0..w {
                if check_roll(&rows, y, x) {
                    moved += 1;
                    rows[y][x] = false;
                }
            }
        }
    }

    println!("{}", moved);
}