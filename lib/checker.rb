class Checker
  #IN CASE I CANT COUNT TOO WELL
  TOLERANCE = 1

  attr_reader :audience_count, :knowledge, :no_knowledge, :speaker_count

  def initialize(audience_count, knowledge, no_knowledge, speaker_count)
    @audience_count = audience_count
    @knowledge = knowledge
    @no_knowledge = no_knowledge
    @speaker_count = speaker_count
  end

  def valid_participation?
    (knowledge + no_knowledge).between?(audience_count - TOLERANCE, audience_count + TOLERANCE)
  end

end
