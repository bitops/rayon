# a state machine that does not use Fibers

class Turnstile
  def initialize
    @current_state = :locked
  end
  
  def coin
    if locked?
      puts "Thank you. You may enter."
      unlock!
    else
      nil
    end
  end
  
  def push
    if unlocked?
      puts "Welcome!"
      lock!
    else
      nil
    end
  end

  def lock!
    @current_state = :locked
  end

  def unlock!
    @current_state = :unlocked
  end
  
  def locked?  
    @current_state == :locked
  end
  
  def unlocked?  
    !locked?
  end
end

