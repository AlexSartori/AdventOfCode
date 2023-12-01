packets = []

while line = gets
  packets << line.strip
end


def decode_bin_packet(packet)
  version = packet[0,3].to_i 2
  type_id = packet[3,3].to_i 2

  case type_id
  when 4
    groups = ''
    g_idx = 6
    while 1
      g = packet[g_idx,5]
      groups += g[1,4]
      g_idx += 5
      break if g[0] == '0'
    end
    return [version, g_idx]
  else
    if packet[6] == '0'
      # TL_ID = Total subpacket length
      tot_len = packet[7,15].to_i 2
      idx, len = 22, 0
      tot_ver = version
      while len < tot_len
        v, l = decode_bin_packet packet[idx, packet.length]
        len += l
        idx += l
        tot_ver += v
      end

      return tot_ver, idx
    else
      # LT_ID = No. of subpackets
      n_p = packet[7,11].to_i 2
      idx, n, tot_ver = 18, 0, version
      while n < n_p
        v, l = decode_bin_packet packet[idx, packet.length]
        idx += l
        n += 1
        tot_ver += v
      end

      return tot_ver, idx
    end
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
