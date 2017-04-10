class Frame
  MAX_SCORE  = 10
  MIN_SCORE  = 0
  MAX_THROWS = 2
  MIN_THROWS = 1

  def initialize(frame)
    @frame = frame
  end

  def score
    validate!
    @frame.inject :+
  end

  def strike?
    return if blank?
    @frame[0] == MAX_SCORE
  end

  private

  def validate!
    message = "Invalid Input: #{@frame.inspect}."
    raise ArgumentError, 
      "#{message} Frames can't be blank." if blank? 
    raise ArgumentError, 
      "#{message} Frames should be a number between 0 and 10." unless numerical?
    raise ArgumentError, 
      "#{message} Invalid number of throws." unless valid_throw_count?
  end

  def numerical?
    @frame.all? {|i| i.is_a?(Integer) && i >= MIN_SCORE && i <= MAX_SCORE }
  end

  def valid_throw_count?
    return @frame.count == MAX_THROWS unless strike?
    @frame.count == MIN_THROWS
  end

  def blank?
    @frame.nil? || @frame.empty?
  end
end