fn main() {
    let mut start_idx: usize = 0;
    let mut splitter_idxs: Vec<Vec<usize>> = Vec::new();
    let mut w = 0;

    for line in std::io::stdin().lines() {
        let l = line.expect("gah");
        w = l.len();

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

    let mut beams: Vec<u64> = Vec::new();
    beams.extend((0..w).map(|_| 0u64));
    beams[start_idx] = 1;

    for splitters in splitter_idxs.iter() {
        for idx in 0..beams.len() {
            let n_beams = beams[idx];
            if splitters.contains(&idx) {
                beams[idx - 1] += n_beams;
                beams[idx + 1] += n_beams;
                beams[idx] = 0;
            }
        }
    }

    let sum: u64 = beams.into_iter().sum();
    println!("{}", sum);
}