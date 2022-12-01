elves = []
curr_cals = 0

while l = gets do
  if l.strip == "" then
    elves << curr_cals
    curr_cals = 0
  else
    cal_num = l.strip.to_i
    curr_cals += cal_num
  end
end

p elves.sort[-3..].sum
