use std::collections::{HashMap, LinkedList};

#[derive(Clone)]
struct Node {
    id: usize,
    x: f32,
    y: f32,
    z: f32,
}

impl Node {
    fn dist(&self, other: &Node) -> f32 {
        let tmp: f32 =
            (self.x - other.x).powi(2) +
            (self.y - other.y).powi(2) +
            (self.z - other.z).powi(2);
        return tmp.sqrt();
    }
}

fn connect_closest_pair(circuits: &mut Vec<LinkedList<Node>>, distances: &mut HashMap<(usize, usize), f32>) -> bool {
    let mut min_d = None;
    let mut min_link = None;

    for ((i, j), d) in distances.iter() {
        if min_d.is_none() || *d < min_d.unwrap() {
            min_d = Some(*d);
            min_link = Some((*i, *j));
        }
    }

    distances.remove(&min_link.unwrap());

    let (id1, id2) = &min_link.unwrap();
    let mut c1_idx = None;
    let mut c2_idx = None;

    for (i, circuit) in circuits.iter().enumerate() {
        for node in circuit {
            if node.id == *id1 {
                c1_idx = Some(i);
                print!("{},{},{} ", node.x, node.y, node.z);
            }
            if node.id == *id2 {
                c2_idx = Some(i);
                print!("{},{},{} ", node.x, node.y, node.z);
            }
        }

        if c1_idx.is_some() && c2_idx.is_some() {
            break;
        }
    }
    println!();

    if c1_idx.is_none() || c2_idx.is_none() {
        return false;
    }

    if c1_idx == c2_idx {
        return false;
    }
    
    if c1_idx > c2_idx {
        (c1_idx, c2_idx) = (c2_idx, c1_idx);
    }

    let c2 = circuits.remove(c2_idx.unwrap());
    circuits[c1_idx.unwrap()].extend(c2);

    return  true;
}

fn main() {
    let mut num_nodes: usize = 0;
    let mut circuits: Vec<LinkedList<Node>> = Vec::new();

    for line in std::io::stdin().lines() {
        let l = line.expect("read line");
        let pieces: Vec<f32> = l.split(',').map(|n| n.parse().unwrap()).collect();
        let mut circuit = LinkedList::new();
        circuit.push_back(Node {
            id: num_nodes,
            x: pieces[0],
            y: pieces[1],
            z: pieces[2]
        });
        circuits.push(circuit);
        num_nodes += 1;
    }

    let mut distances: HashMap<(usize, usize), f32> = HashMap::new();
    for i in 0..num_nodes {
        for j in (i+1)..num_nodes {
            distances.insert((i, j), circuits[i].front().unwrap().dist(circuits[j].front().unwrap()));
        }
    }

    for _ in 0..1000 {
        connect_closest_pair(&mut circuits, &mut distances);
    }

    let mut lengths: Vec<usize> = circuits.iter().map(|c| c.len()).collect();
    lengths.sort_unstable();
    let top3: Vec<usize> = lengths.into_iter().rev().take(3).collect();
    println!("{} > {} > {}", top3[0], top3[1], top3[2]);
    let prod = top3.into_iter().reduce(|acc, e| acc * e).unwrap();
    println!("{}", prod);
}