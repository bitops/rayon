require 'fiber'

class InfiniteSeries

  def initialize
    @value = 0
    @series = Fiber.new do
      loop do
        Fiber.yield(@value += 1)
      end
    end
  end

  def next
    @series.resume
  end
  
end
