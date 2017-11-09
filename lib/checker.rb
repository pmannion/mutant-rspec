class Checker
  #IN CASE I CANT COUNT TOO WELL
  TOLERANCE = 1

  attr_reader :audience_count, :knowledge, :no_knowledge, :speaker_count

  def initialize(audience_count, knowledge, no_knowledge, speaker_count)
    @audience_count = audience_count || 0
    @knowledge = knowledge || 0
    @no_knowledge = no_knowledge || 0
    @speaker_count = speaker_count || 0
  end

  def valid_participation?
    return "Don't give me rubbish" if !audience_count.is_a?(Integer)
    return "Don't give me rubbish" if !knowledge.is_a?(Integer)
    return "Don't give me rubbish" if !no_knowledge.is_a?(Integer)
    return "Don't give me rubbish" if !speaker_count.is_a?(Integer)
    return 'Paul, You forgot to count the audience total!' if audience_count == 0
    return 'Audience, the speaker could not make it!' if speaker_count == 0
    (knowledge + no_knowledge).between?(audience_count - TOLERANCE, audience_count + TOLERANCE)
  end

end
