class Monkey
    attr_accessor :id, :items, :op, :test, :if_1, :if_2, :inspected
    def initialize(id, it, op, t, if_1, if_2)
        @id = id
        @items = it
        @op = op
        @test = t
        @if_1 = if_1
        @if_2 = if_2
        @inspected = 0
    end
    
    def to_s
        return "##{@id} [#{@items.join ','}]"
    end
end


def monkey_turn m
    until m.items.empty? do
        # 1. Inspect item
        i = m.items.shift()
        m.inspected += 1
        
        # 2. Update worry level
        i = eval m.op.gsub("old", i.to_s)

        # 3. floor(worry/3)
        i = (i/3).floor

        # 4. Test worry level
        t = i % m.test == 0
        m2 = $monkeys[t ? m.if_1 : m.if_2]

        # 5. Throw item
        m2.items.append i
    end
end


$monkeys = Hash.new

STDIN.read.split("\n\n").each do |raw|
    l = raw.split "\n"
    m_id = /Monkey ([0-9]+):$/.match(l[0]).captures[0].to_i
    items = /items: ([0-9 ,]+)$/.match(l[1]).captures[0].split(',').map &:to_i
    op = /new = (.+)$/.match(l[2]).captures[0]
    test = /divisible by (.+)$/.match(l[3]).captures[0].to_i
    if_1 = /to monkey ([0-9]+)$/.match(l[4]).captures[0].to_i
    if_2 = /to monkey ([0-9]+)$/.match(l[5]).captures[0].to_i
    
    $monkeys.store m_id, Monkey.new(m_id, items, op, test, if_1, if_2)
end

for i in 0...20 do
    $monkeys.each do |id, m|
        monkey_turn m
    end
end

a, b = $monkeys.values.map(&:inspected).sort[-2..]
p a*b
