require_relative 'frame'

class LastFrame < Frame
  MAX_THROWS = 3
  MIN_THROWS = 2

  private

  def valid_throw_count?
    return @frame.count == MAX_THROWS if strike?
    @frame.count == MIN_THROWS
  end

  def second_throw_strike?
    @frame[1] == MAX_SCORE
  end

  def max_score
    return MAX_SCORE * MAX_THROWS if second_throw_strike?
    return MAX_SCORE * MIN_THROWS if strike?
    MAX_SCORE
  end

  def validate_score!(score)
    raise ArgumentError, 
      "#{error_message} Frame scores should have a maximum total of #{max_score}." if score > max_score
  end
end