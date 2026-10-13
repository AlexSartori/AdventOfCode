// Coordinate compression
// https://medium.com/algorithms-digest/coordinate-compression-2fff95326fb

use std::collections::VecDeque;

#[derive(Clone)]
#[derive(PartialEq)]
enum Tile {
    Boundary,
    Invalid,
    Valid
}

struct CompressedGrid {
    rows: Vec<usize>,
    cols: Vec<usize>,
    compressed_grid: Vec<Vec<Tile>>,
}

impl CompressedGrid {
    fn new(coords: &Vec<(usize, usize)>) -> Self {
        let mut xs: Vec<usize> = coords.iter().map(|(x, _)| *x).collect();
        let mut ys: Vec<usize> = coords.iter().map(|(_, y)| *y).collect();

        xs.sort_unstable();
        ys.sort_unstable();

        xs.dedup();
        ys.dedup();

        let grid = vec![vec![Tile::Valid; xs.len() + 2]; ys.len() + 2]; // Add some margin for the flood fill
        
        Self { rows: ys, cols: xs, compressed_grid: grid }
    }

    // fn iter(&self) -> RectanglesIterator<'_> {
    //     RectanglesIterator { grid: self, i: 0, j: 1 }
    // }

    fn draw_line(&mut self, a: (usize, usize), b: (usize, usize)) {
        let (mut x1, mut y1) = self.compress_point(a.0, a.1);
        let (mut x2, mut y2) = self.compress_point(b.0, b.1);

        if y1 == y2 {
            (x1, x2) = (x1.min(x2), x1.max(x2));
            self.compressed_grid[y1][x1..=x2].fill(Tile::Boundary);
        } else {
            // Assume x1 == x2 :)
            (y1, y2) = (y1.min(y2), y1.max(y2));
            self.compressed_grid[y1..=y2].iter_mut().for_each(|r| r[x1] = Tile::Boundary);
        }
    }

    fn compress_point(&self, x: usize, y: usize) -> (usize, usize) {
        (self.cols.binary_search(&x).unwrap() + 1, self.rows.binary_search(&y).unwrap() + 1)
    }

    fn floodfill(&mut self) {
        let mut frontier: VecDeque<(isize, isize)> = VecDeque::new();
        frontier.push_back((0, 0)); // Assumption: 0,0 is outside
        self.compressed_grid[0][0] = Tile::Invalid;

        let h = self.compressed_grid.len() as isize;
        let w = self.compressed_grid[0].len() as isize;
        while let Some((x, y)) = frontier.pop_front() {
            for _dy in -1..=1 {
                if y + _dy < 0 || y + _dy >= h { continue; }
                let dy = (y + _dy) as usize;

                for _dx in -1..=1 {
                    if _dy == 0 && _dx == 0 { continue; }
                    if x + _dx < 0 || x + _dx >= w { continue; }
                    let dx = (x + _dx) as usize;

                    if self.compressed_grid[dy][dx] == Tile::Valid {
                        self.compressed_grid[dy][dx] = Tile::Invalid;
                        frontier.push_back((dx as isize, dy as isize));
                    }
                }
            }
        }
    }

    fn is_rect_valid(&self, a: (usize, usize), b: (usize, usize)) -> bool {
        let (x1, y1) = self.compress_point(a.0, a.1);
        let (x2, y2) = self.compress_point(b.0, b.1);

        for y in y1.min(y2)..=y1.max(y2) {
            for x in x1.min(x2)..=x1.max(x2) {
                if self.compressed_grid[y][x] == Tile::Invalid {
                    return false;
                }
            }
        }
        true
    }

    fn print_grid(&self) {
        for row in &self.compressed_grid {
            for c in row {
                match c {
                    Tile::Invalid => print!(" "),
                    Tile::Boundary => print!("o"),
                    _ => print!("#")
                }
            }
            println!();
        }
    }
}

#[derive(Debug)]
struct Rectangle {
    x1: usize,
    y1: usize,
    x2: usize,
    y2: usize
}

impl Rectangle {
    fn area(&self) -> u64 {
        ((self.x2.abs_diff(self.x1) + 1) as u64) * ((self.y2.abs_diff(self.y1) + 1) as u64)
    }
}

fn main() {
    let mut coords: Vec<(usize, usize)> = Vec::new();

    for line in std::io::stdin().lines() {
        let l = line.expect("read line");
        let pieces: Vec<usize> = l.split(',').map(|n| n.parse().unwrap()).collect();
        coords.push((pieces[0], pieces[1]));
    }
    
    let mut compressed_grid = CompressedGrid::new(&coords);

    for i in 0..(coords.len() - 1) {
        compressed_grid.draw_line(coords[i], coords[i+1]);
    }
    compressed_grid.draw_line(coords[coords.len() - 1], coords[0]);
    
    compressed_grid.floodfill();
    compressed_grid.print_grid();

    let mut max_area = 0;
    for i in 0..coords.len() {
        let (x1, y1) = coords[i];

        for j in (i+1)..coords.len() {
            let (x2, y2) = coords[j];
            let r = Rectangle{ x1: x1, y1: y1, x2: x2, y2: y2 };
            
            let area = r.area();
            let valid = compressed_grid.is_rect_valid((x1, y1), (x2, y2));

            if valid && area > max_area {
                max_area = area;
            }
        }
    }

    println!("{}", max_area);
}