def some_method(*args)
  args.first.downto(args.last).each {|num| puts num }
end

some_method(1)

