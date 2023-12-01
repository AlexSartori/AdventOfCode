window = []

gets.strip.chars.each_with_index do |c, i|
  window << c
  window.shift if window.count > 4

  if window.uniq.count == 4 then
    p i+1
    break
  end
end
