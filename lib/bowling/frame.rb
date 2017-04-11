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
    calculate_score
  end

  def strike?
    return if blank?
    @frame[0] == MAX_SCORE
  end

  private

  def error_message
    "Invalid Input: #{@frame.inspect}."
  end

  def validate!
    raise ArgumentError, 
      "#{error_message} Frames can't be blank." if blank? 
    raise ArgumentError, 
      "#{error_message} Frames should be a number between 0 and 10." unless numerical?
    raise ArgumentError, 
      "#{error_message} Invalid number of throws." unless valid_throw_count?
  end

  def validate_score!(score)
    raise ArgumentError, 
      "#{error_message} Frame scores should have a maximum total of #{MAX_SCORE}." if score > MAX_SCORE
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

  def calculate_score
    score = @frame.inject :+
    validate_score!(score)
    score
  end
end