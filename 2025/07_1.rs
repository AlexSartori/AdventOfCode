use std::{collections::HashSet};

fn main() {
    let mut start_idx: usize = 0;
    let mut splitter_idxs: Vec<Vec<usize>> = Vec::new();

    for line in std::io::stdin().lines() {
        let l = line.expect("gah");

        if l.contains('S') {
            start_idx = l.find('S').unwrap();
        } else {
            let tmp =
                l.char_indices()
                .filter(|(_, c)| *c == '^')
                .map(|(i, _)| i)
                .collect();
            splitter_idxs.push(tmp);
        }
    }

    let mut n_splits = 0i32;
    let mut curr_idxs: HashSet<usize> = HashSet::new();
    curr_idxs.insert(start_idx);

    for row in splitter_idxs.iter() {
        for x in 0usize..*curr_idxs.iter().max().unwrap() {
            print!("{}", if curr_idxs.contains(&x) {'|'} else {' '});
        }
        println!();
        let mut new_idxs = HashSet::new();
        
        for i in curr_idxs {
            if row.contains(&i) {
                n_splits += 1;
                // No need to check boundaries bc lazy+looked at the input
                new_idxs.insert(i - 1);
                new_idxs.insert(i + 1);
            } else {
                new_idxs.insert(i);
            }
        }

        curr_idxs = new_idxs;
    }

    println!("{}", n_splits);
}