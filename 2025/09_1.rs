
fn main() {
    let mut coords: Vec<(u64, u64)> = Vec::new();

    for line in std::io::stdin().lines() {
        let l = line.expect("read line");
        let pieces: Vec<u64> = l.split(',').map(|n| n.parse().unwrap()).collect();
        coords.push((pieces[0], pieces[1]));
    }

    let mut largest_area = 0u64;
    for i in 0..coords.len() {
        let (x1, y1) = coords[i];
        for j in (i+1)..coords.len() {
            let (x2, y2) = coords[j];
            let a = (x1.max(x2) - x1.min(x2) + 1) * (y1.max(y2) - y1.min(y2) + 1);
            largest_area = largest_area.max(a);
        }
    }

    println!("{}", largest_area);
}