inst = []
while line = gets
  inst << line.split(' ')
end

def is_n(n)
  n.to_i != 0 or n == '0'
end

regs = Hash['x' => 0, 'y' => 1, 'z' => 2, 'w' => 3]
states = Hash[0 => [0, 0, 0, 0]]
states_cache = Hash.new

class Range
  def *(obj)
    (self.first*obj)..(self.last*obj)
  end
end

cnt = 1
inst.each do |i, a, b|
  puts "\nInstruction##{cnt}: #{i} #{a} #{b}"
  cnt += 1

  case i
  when 'inp'
    new_states = Hash.new
    states.keys.each do |k|
      (9.downto(1)).each do |val|
        states_cache.delete states[k]
        new_val = states[k].dup
        new_val[regs[a]] = val
        new_k = k*10 + val
        next if new_val[regs['z']] > 1000000

        if (not states_cache.key? new_val) or states_cache[new_val] < new_k
          new_states[new_k] = new_val
          states_cache[new_val] = new_k
        end
      end
    end
    states = new_states
  when 'mul'
    states.keys.each { |k| states[k][regs[a]] *= (is_n(b) ? b.to_i : states[k][regs[b]]) }
  when 'eql'
    states.each do |k, s|
      v = is_n(b) ? b.to_i : states[k][regs[b]]
      s[regs[a]] = (s[regs[a]] == v) ? 1 : 0
    end
  when 'add'
    states.keys.each { |k| states[k][regs[a]] += (is_n(b) ? b.to_i : states[k][regs[b]]) }
  when 'div'
    states.keys.each { |k| states[k][regs[a]] /= (is_n(b) ? b.to_i : states[k][regs[b]]) }
  when 'mod'
    states.keys.each { |k| states[k][regs[a]] %= (is_n(b) ? b.to_i : states[k][regs[b]]) }
  else
    puts "Instruction not implemented"
    break
  end

  puts "States: #{states.size}"
end

puts "\nInputs for which z = 0:"
states.each do |k, v|
  next if v[regs['z']] != 0
  puts k
end

puts "\nHighest key with z=0: #{states.keys.select{|k|states[k][regs['z']]==0}.max}"
