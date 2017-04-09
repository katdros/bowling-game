require_relative 'frame'
require_relative 'last_frame'

class BowlingGame
  FRAME_COUNT = 10

  def initialize(frames)
    @frames = frames
  end

  def running_score
    begin
      validate!
      calculate_score
    rescue ArgumentError => e
      e.message
    end
  end

  private

  def validate!
    raise ArgumentError, "Invalid Input: Game Scores can't be blank" if blank? 
    raise ArgumentError, "Invalid Input: Invalid Frame count" unless has_valid_frame_count?
  end

  def has_valid_frame_count?
    @frames.count == FRAME_COUNT
  end

  def blank?
    @frames.nil? || @frames.empty?
  end

  def frame_score(frame)
    Frame.new(frame).score
  end

  def last_index
    @frames.count - 1
  end

  def calculate_score
    running_score = 0
    score_array   = Array.new

    @frames.each_with_index do |frame, index|
      running_score += calculate_total_frame_score(frame, index).to_i
      score_array << running_score
    end

    return score_array
  end

  def calculate_total_frame_score(frame, index)
    if index == last_index
      LastFrame.new(frame).score
    else
      frame = Frame.new(frame)
      frame.score + additional_score(frame, index).to_i
    end
  end

  def additional_score(frame, index)
    return 0 unless frame.strike?

    nexts = @frames[index, 3]
    next_2 = nexts.flatten[1,2]
    next_2.inject{ |sum,x| sum + x.to_i }
  end
end
