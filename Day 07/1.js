const fs = require('fs');

let lines = fs.readFileSync('input', 'utf-8').split('\n');

let G = {};


function parse_children(ch) {
    ch = ch.split('bag')[0]; // Strips also 'bags', 'bag.', 'bags.', ...
    let split_idx = ch.indexOf(' ');
    let num = parseInt(ch.substring(0, split_idx));
    let color = ch.substring(split_idx + 1).trim();

    // return {
    //     color: color,
    //     qty: num
    // }
    return color;
}

function add_to_graph(parent, children) {
    // Create an inverted graph
    children.forEach((ch) => {
        if (G[ch] === undefined)
            G[ch] = [];
        G[ch].push(parent);
    });
}

lines.forEach((line) => {
    if (line.trim() == "")
        return;

    line = line.split(' bags contain ');
    let parent = line[0];
    let children_raw = line[1].split(', ');

    let children_parsed = [];
    children_raw.forEach((ch) =>
        children_parsed.push(parse_children(ch))
    );

    add_to_graph(parent, children_parsed);
});


let containers = [];
let queue = ['shiny gold'];

while (queue.length > 0) {
    let curr = queue.pop();
    let parents = G[curr];

    if (parents === undefined)
        continue;

    parents.forEach((p) => {
        if (containers.indexOf(p) == -1) {
            containers.push(p);

            if (queue.indexOf(p) == -1)
                queue.push(p);
        }
    });
}

console.log(containers.length);
