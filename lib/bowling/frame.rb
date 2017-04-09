class Frame
  MAX_SCORE = 10
  MIN_SCORE = 0
  MAX_BALLS = 2

  def initialize(frame)
    @frame = frame
  end

  def score
    validate!
    total
  end

  def strike?
    return if blank?
    @frame[0] == MAX_SCORE
  end

  private

  def validate!
    raise ArgumentError, "Invalid Input: Frames can't be blank" if blank? 
    raise ArgumentError, 'Invalid Input: Frames should be numerical' unless numerical?
    raise ArgumentError, 'Invalid Input: Invalid number of balls' unless has_valid_ball_count?
  end

  def numerical?
    @frame.all? {|i| i.is_a?(Integer) && i >= MIN_SCORE && i <= MAX_SCORE }
  end

  def has_valid_ball_count?
    if self.strike?
      @frame.count == 1
    else
      @frame.count == MAX_BALLS
    end
  end

  def blank?
    @frame.nil? || @frame.empty?
  end

  def total
    @frame.inject{ |sum,x| sum + x.to_i }
  end
end