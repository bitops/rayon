require 'fiber'

f = Fiber.new do
  puts "I am the first fiber, and I'm starting now."
  Fiber.yield
  puts "I am the first fiber, and I'm stopping now."
end

f.resume
puts "I am the outer execution context, in control."
f.resume

