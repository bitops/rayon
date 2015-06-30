require 'fiber'

f1 = Fiber.new do
  puts "fiber: Start doing stuff."
  Fiber.yield
  puts "fiber: We can still do more stuff."
  Fiber.yield
  puts "fiber: Do the last thing, now we're dead."
end

puts "outer: Start running the fiber."
while(f1.alive?) do
  puts "outer: Let the fiber do some work."
  f1.resume
end
puts "outer: Stop running the fiber."
