window = []

gets.strip.chars.each_with_index do |c, i|
  window << c
  window.shift if window.count > 14

  if window.uniq.count == 14 then
    p i+1
    break
  end
end
