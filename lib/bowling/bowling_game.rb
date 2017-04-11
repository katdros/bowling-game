require_relative 'frame'
require_relative 'last_frame'

class BowlingGame
  FRAME_COUNT            = 10
  ADDITIONAL_SCORE_COUNT = 2

  def initialize(frames)
    @frames = frames
  end

  def score
    begin
      validate!
      calculate_score
    rescue ArgumentError => e
      e.message
    end
  end

  private

  def validate!
    raise ArgumentError, 
      "Invalid Input: Game Scores can't be blank." if blank? 
    raise ArgumentError, 
      "Invalid Input: Invalid Frame count (#{@frames.count})." unless valid_frame_count?
  end

  def valid_frame_count?
    @frames.count == FRAME_COUNT
  end

  def blank?
    @frames.nil? || @frames.empty?
  end

  def calculate_score
    running_score = 0
    @frames.each_with_index.map{ |frame, index| 
      running_score += calculate_total_frame_score(frame, index) 
    }
  end

  def calculate_total_frame_score(frame, index)
    return last_frame_score(frame) if index == last_index
    frame_score(frame, index)
  end

  def last_frame_score(frame)
    LastFrame.new(frame).score
  end

  def frame_score(frame, index)
    frame_object = Frame.new(frame)
    frame_object.score + additional_score(frame_object, index).to_i
  end
  
  def last_index
    @frames.count - 1
  end

  def additional_score(frame_object, index)
    return 0 unless frame_object.strike?
    next_scores(index).inject :+
  end

  def next_scores(index)
    next_frames(index).flatten[1, ADDITIONAL_SCORE_COUNT]
  end

  def next_frames(index)
    length = ADDITIONAL_SCORE_COUNT + 1
    @frames[index, length]
  end
end
