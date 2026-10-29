use std::collections::VecDeque;

struct Machine {
    target_state: Vec<bool>,
    buttons: Vec<Vec<usize>>
}

#[derive(Clone)]
struct MachineState {
    num_presses: i32,
    btn_history: Vec<usize>,
    state: Vec<bool>
}

fn main() {
    let mut all_machines: Vec<Machine> = Vec::new();

    for line in std::io::stdin().lines() {
        let l = line.expect("grr");
        let (indicators_raw, remainder) = l.split_once(' ').unwrap();
        let indicators: Vec<bool> = indicators_raw[1..indicators_raw.len()-1].chars().map(|c| c == '#').collect();
        let (btn_maps_raw, _) = remainder.rsplit_once(' ').unwrap();
        let btn_maps: Vec<Vec<usize>> = btn_maps_raw.split(' ')
            .map(|b|
                b[1..b.len()-1].split(',')
                .map(|n| n.parse::<usize>().unwrap())
                .collect::<Vec<usize>>()
            ).collect();
        all_machines.push(Machine {
            target_state: indicators,
            buttons: btn_maps
        });
    }

    let mut tot_presses = 0i32;

    for (m_idx, curr_machine) in all_machines.iter().enumerate() {
        // Emulate a BFS-like exploration of button presses
        let mut frontier: VecDeque<MachineState> = VecDeque::new();
        frontier.push_back(MachineState {
            num_presses: 0,
            btn_history: Vec::new(),
            state: vec![false; curr_machine.target_state.len()]
        });

        // BFS-like exploration
        while let Some(cursor) = frontier.pop_front() {
            if cursor.state.iter().zip(&curr_machine.target_state).all(|(a,b)| *a == *b) {
                println!("Machine {}, {} presses", m_idx, cursor.num_presses);
                tot_presses += cursor.num_presses;
                break;
            } else {
                for (button_idx, button) in curr_machine.buttons.iter().enumerate() {
                    if cursor.btn_history.contains(&button_idx) {
                        continue;
                    } else {
                        let mut new_m = cursor.clone();
                        new_m.num_presses += 1;
                        new_m.btn_history.push(button_idx);
                        for b_idx in button {
                            new_m.state[*b_idx] ^= true;
                        }
                        frontier.push_back(new_m);
                    }
                }
            }
        }
    }

    println!("Sum of min presses: {}", tot_presses);
}