coords = []
folds = []

while line = gets
  if (line = line.strip) == '' then next end
  if line.include? ','
    coords << line.split(',').map(&:to_i)
  else
    folds << line.split(' ')[2].split('=')
  end
end

folds.each do |axis, val|
  val = val.to_i
  coords = coords.map { |x, y|
    if (axis == 'x' and x < val) or (axis == 'y' and y < val)
      [x, y]
    else
      if axis == 'x'
        [val - (x - val), y]
      else
        [x, val - (y - val)]
      end
    end
  }.uniq
end

require 'matplotlib/pyplot'
plt = Matplotlib::Pyplot
plt.scatter coords.map{|x,y|x}, coords.map{|x,y|5-y}
plt.show

