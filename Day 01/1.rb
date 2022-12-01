max_cals = 0
curr_cals = 0

while l = gets do
  if l.strip == "" then
    max_cals = curr_cals if curr_cals > max_cals
    curr_cals = 0
  else  
    cal_num = l.strip.to_i
    curr_cals += cal_num
  end
end

p max_cals
