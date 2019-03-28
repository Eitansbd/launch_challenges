def reduce(start_value=0, object)
  index = 0
  running_total = start_value

  while index < object.size
    running_total = yield(object[index], running_total)
    index += 1
  end

  running_total
end

a = [1,2,3,4]
b = reduce(a) do |num, total|
  total + num
end

p b
