require_relative 'frame'

class LastFrame < Frame
  MAX_THROWS = 3
  MIN_THROWS = 2

  private

  def valid_throw_count?
    return @frame.count == MAX_THROWS if strike?
    @frame.count == MIN_THROWS
  end
end