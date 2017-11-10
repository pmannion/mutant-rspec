require 'checker'
require 'byebug'

describe Checker do
  let(:checker) { Checker.new(knowledge, no_knowledge, audience_count, speaker_present) }
  let(:knowledge) { 10 }
  let(:no_knowledge) { 10 }
  let(:audience_count) { 20 }
  let(:speaker_present) { true }

  ####### STAGE 0 HAPPY PATH ########

  describe '#valid_participation?' do
    context 'when all audience members particpate' do
      it 'returns TRUE' do
        expect(checker.valid_participation?).to eq(true)
      end
    end

    ####### STAGE 1 TOLERANCE ########


    # context 'when there is a count error of -1' do
    #   let(:no_knowledge) { 9 }
    #
    #   it 'Is inside the TOLERANCE & returns TRUE' do
    #     expect(checker.valid_participation?).to eq(true)
    #   end
    # end
    #
    # context 'when there is a count error of +1' do
    #   let(:no_knowledge) { 11 }
    #
    #   it 'Is inside the TOLERANCE & returns TRUE' do
    #     expect(checker.valid_participation?).to eq(true)
    #   end
    # end



    ############# STAGE 2 MISSING/INCORRECT AUDIENCE  ########

    #
    # context 'when audience is miscounted' do
    #   let(:audience_count) { 22 }
    #
    #   it 'returns false' do
    #     expect(checker.valid_participation?).to eq(false)
    #   end
    # end



    ############ STAGE 3 MISSING SPEAKER  ########


    # context 'when speaker is NOT PRESENT' do
    #   let(:speaker_present) { false }
    #
    #   it 'returns false' do
    #     expect(checker.valid_participation?).to eq(false)
    #   end
    # end
    #
    # context 'when speaker is nil' do
    #   let(:speaker_present) { nil }
    #
    #   it 'returns false' do
    #     expect(checker.valid_participation?).to eq(false)
    #   end
    # end

  end
end
