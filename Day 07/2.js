const fs = require('fs');

let lines = fs.readFileSync('input', 'utf-8').split('\n');

let G = {};


function parse_children(ch) {
    ch = ch.split('bag')[0]; // Strips also 'bags', 'bag.', 'bags.', ...
    let split_idx = ch.indexOf(' ');
    let num = parseInt(ch.substring(0, split_idx));
    let color = ch.substring(split_idx + 1).trim();

    return {
        color: color,
        qty: num
    }
}

function add_to_graph(parent, children) {
    if (G[parent] === undefined)
        G[parent] = [];

    children.forEach((ch) => {
        G[parent].push(ch);
    });
}

lines.forEach((line) => {
    if (line.trim() == "")
        return;

    line = line.split(' bags contain ');
    let parent = line[0];
    let children_raw = line[1].split(', ');

    let children_parsed = [];
    children_raw.forEach((ch) => {
        if (ch != "no other bags.")
            children_parsed.push(parse_children(ch))
        }
    );

    add_to_graph(parent, children_parsed);
});


function dfs(start, log_indent) {
    if (G[start] === undefined)
        return 1;

    console.log(log_indent + "[DFS@" + start + "]");
    console.log(G[start]);

    let ch_num = 0; // Me
    G[start].forEach((ch) => {
        let bags_n = dfs(ch.color, log_indent + '  ');
        ch_num += ch.qty + bags_n * ch.qty;
        console.log(log_indent + "Qty += " + ch.qty + " + " + bags_n + " * " + ch.qty);
    });

    console.log(log_indent + "Returning: " + ch_num);
    return ch_num;
}

qty = dfs('shiny gold', '');
console.log(qty);
