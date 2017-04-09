require_relative 'frame'

class LastFrame < Frame
  MAX_BALLS = 3

  private

  def has_valid_ball_count?
    if strike?
      @frame.count == MAX_BALLS
    else
      @frame.count == 2
    end
  end
end