class Checker
  #IN CASE I CANT COUNT TOO WELL
  TOLERANCE = 1

  attr_reader :knowledge, :no_knowledge, :audience_count, :speaker_present

  def initialize(knowledge, no_knowledge, audience_count, speaker_present)
    @knowledge = knowledge
    @no_knowledge = no_knowledge
    @audience_count = audience_count
    @speaker_present = speaker_present
  end

  def valid_participation?
    if speaker_present
      #Allowable range is between 19 and 21, allowing a tolerance of 1 each side (based on audience size of 20)
      (knowledge + no_knowledge).between?(audience_count - TOLERANCE, audience_count + TOLERANCE)
    else
      false
    end
  end

end
