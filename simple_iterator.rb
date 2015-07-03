require 'fiber'

class SimpleIterator
  include Enumerable

  def initialize(*args)
    @values = args
    rewind!
  end

  def has_next?
    @enumerator.alive?
  end

  def next
    if has_next?
      @enumerator.resume
    else
      nil
    end
  end

  def each
    @values.each {|_| yield(self.next) }
  end

  def rewind!
    @enumerator = Fiber.new do
      @values.each do |value|
        Fiber.yield value
      end
      nil
    end
  end
end
