require 'fiber'

f1 = Fiber.new do |fiber| # we are called with f2 from 'resume'
  puts "f1: ping"
  fiber.transfer Fiber.current # we transfer ourselves to f2
  puts "f1: ping"
  fiber.transfer # transfer to f2
  puts "f1: ping"
  fiber.transfer # transfer to f2
end

f2 = Fiber.new do |fiber| # we are called with f1 from first 'transfer'
  puts "f2: pong"
  fiber.transfer # transfer back to f1
  puts "f2: pong"
  fiber.transfer # transfer back to f1
  puts "f2: pong"
end

f1.resume f2
