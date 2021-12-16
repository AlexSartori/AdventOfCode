packets = []

while line = gets
  packets << line.strip
end


def decode_bin_packet(packet)
  version = packet[0,3].to_i 2
  type_id = packet[3,3].to_i 2

  if type_id == 4
    groups = ''
    g_idx = 6
    while 1
      g = packet[g_idx,5]
      groups += g[1,4]
      g_idx += 5
      break if g[0] == '0'
    end
    return [groups.to_i(2), g_idx]
  else
    vals = []
    idx = 6

    if packet[6] == '0'
      tot_len = packet[7,15].to_i 2
      idx = 22
      len = 0
      while len < tot_len
        v, l = decode_bin_packet packet[idx, packet.length]
        len += l
        idx += l
        vals << v
      end
    else
      n_p = packet[7,11].to_i 2
      idx = 18
      n = 0
      while n < n_p
        v, l = decode_bin_packet packet[idx, packet.length]
        idx += l
        n += 1
        vals << v
      end
    end

    res = 0
    case type_id
    when 0
      res = vals.sum
    when 1
      res = vals.reduce { |r, x| r *= x }
    when 2
      res = vals.min
    when 3
      res = vals.max
    when 5
      res = vals[0] > vals[1] ? 1 : 0
    when 6
      res = vals[0] < vals[1] ? 1 : 0
    when 7
      res = vals[0] == vals[1] ? 1 : 0
    end

    return [res, idx]
  end
end

sum = 0

packets.each do |packet|
  bin = packet.to_i(16).to_s(2)

  while bin.length % 4 != 0
    bin = '0' + bin
  end

  v, _ = decode_bin_packet bin
  sum += v
end

puts sum
