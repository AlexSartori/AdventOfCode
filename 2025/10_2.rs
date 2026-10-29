struct Machine {
    target_state: Vec<i32>,
    buttons: Vec<Vec<usize>>
}

fn print_matrix(m: &Vec<Vec<i32>>) {
    println!();
    for row in m {
        print!("|");
        for (i, c) in row.iter().enumerate() {
            if i == row.len() - 1 {
                print!(": {:-3} ", c);
            } else {
                print!("{:-3} ", c);
            }
        }
        println!("|");
    }
    println!();
}

fn gcd(a: i32, b: i32) -> i32 {
    if b == 0 { a.abs() } else { gcd(b, a % b) }
}

fn solve_machine(machine: &Machine) -> Option<(i32, Vec<i32>)> {
    let n_vars = machine.buttons.len();
    let n_eqs = machine.target_state.len();
    let mut matrix = vec![vec![0; n_vars+1]; n_eqs];

    for (bi, b) in machine.buttons.iter().enumerate() {
        for i in b {
            matrix[*i][bi] = 1;
        }
    }
    (0..n_eqs).for_each(|i| matrix[i][n_vars] = machine.target_state[i]);

    let pivot_cols = forward_elimination(&mut matrix);

    let free_vars: Vec<usize> = (0..n_vars).filter(
        |c| !pivot_cols.contains(c)
    ).collect();
    
    let max_presses: Vec<i32> = machine.buttons.iter().map(
        |b| b.iter().map(
            |&i| machine.target_state[i]
        ).min().unwrap_or(0)
    ).collect();

    print_matrix(&matrix);

    let mut best: Option<(i32, Vec<i32>)> = None;
    let mut vals = vec![0i32; free_vars.len()];

    loop {
        let mut x = vec![0i32;n_vars];
        for (i, &c) in free_vars.iter().enumerate() {
            x[c] = vals[i];
        }

        if back_substitution(&matrix, &pivot_cols, &mut x) {
            let sum = x.iter().sum();
            if best.is_none() || sum < best.as_ref().unwrap().0 {
                best = Some((sum, x));
            }
        }

        let mut k = 0;
        loop {
            if k == free_vars.len() { return best; }
            if vals[k] < max_presses[free_vars[k]] {
                vals[k] += 1;
                break;
            } else {
                vals[k] = 0;
                k += 1;
            }
        }
    }
}

fn forward_elimination(m: &mut Vec<Vec<i32>>) -> Vec<usize> {
    let n_eqs = m.len();
    let mut pivot_row = 0;
    let mut pivot_cols = Vec::new();

    for k in 0..m[0].len() {
        if pivot_row == n_eqs { break; }

        let mut i_max = pivot_row;
        let mut v_max = m[pivot_row][k].abs();
        for i in (pivot_row+1)..n_eqs {
            if m[i][k].abs() > v_max {
                v_max = m[i][k].abs();
                i_max = i;
            }
        }

        if i_max != pivot_row {
            let tmp = m.remove(i_max);
            m.insert(pivot_row, tmp);
        }

        if m[pivot_row][k] == 0 { continue; }

        let p = m[pivot_row][k];
        for ri in (pivot_row+1)..n_eqs {
            let e = m[ri][k];
            if e == 0 { continue; }
            for ci in 0..m[ri].len() {
                m[ri][ci] = m[ri][ci] * p - m[pivot_row][ci] * e;
            }
            let g = m[ri].iter().fold(0, |acc, &x| gcd(acc, x));
            if g > 1 {
                for x in m[ri].iter_mut() { *x /= g; }
            }
        }

        pivot_cols.push(k);
        pivot_row += 1;
    }

    pivot_cols
}

fn back_substitution(m: &Vec<Vec<i32>>, pivot_cols: &Vec<usize>, x: &mut Vec<i32>) -> bool {
    let n_vars = m[0].len() - 1;

    for i in (0..pivot_cols.len()).rev() {
        let pc = pivot_cols[i];
        let mut rhs = m[i][n_vars];
        
        for j in (pc+1)..n_vars {
            rhs -= x[j] * m[i][j];
        }

        let p = m[i][pc];
        if p == 0 || rhs % p != 0 { return false; }
        x[pc] = rhs / p;
        if x[pc] < 0 { return false; }
    }

    true
}

fn main() {
    let mut all_machines: Vec<Machine> = Vec::new();

    for line in std::io::stdin().lines() {
        let l = line.expect("grr");

        let (_, remainder) = l.split_once(' ').unwrap();
        let (btn_maps_raw, joltages_raw) = remainder.rsplit_once(' ').unwrap();
        let mut btn_maps: Vec<Vec<usize>> = btn_maps_raw.split(' ')
            .map(|b|
                b[1..b.len()-1].split(',')
                .map(|n| n.parse::<usize>().unwrap())
                .collect::<Vec<usize>>()
            ).collect();

        let joltages: Vec<i32> = joltages_raw[1..joltages_raw.len()-1].split(',')
            .map(|j| j.parse::<i32>().unwrap())
            .collect();

        if joltages.len() > btn_maps.len() {
            for _ in 0..(joltages.len()-btn_maps.len()) {
                btn_maps.push(vec![]);
            }
        }
        all_machines.push(Machine {
            target_state: joltages,
            buttons: btn_maps
        });
    }

    let mut tot_presses = 0;
    for m in all_machines {
        let sol = solve_machine(&m).unwrap();

        let mut state = vec![0;m.target_state.len()];
        for (n, b) in sol.1.iter().zip(&m.buttons) {
            for si in b {
                state[*si] += n;
            }
        }
        println!("X: {:?}   =>   Joltages: {:?}\n", sol.1, state);
        tot_presses += sol.0;
    }

    println!("\nTotal presses: {}\n", tot_presses);

}