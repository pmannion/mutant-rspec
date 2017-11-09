require "checker"
require 'byebug'

describe Checker do
  let(:checker) { Checker.new(audience_count, knowledge, no_knowledge, speaker_count) }
  let(:audience_count) { 20 }
  let(:knowledge) { 10 }
  let(:no_knowledge) { 10 }
  let(:speaker_count) { 1 }

  describe '#valid_participation?' do
    context 'when all audience members particpate' do
      it 'returns TRUE' do
        expect(checker.valid_participation?).to eq(true)
      end
    end

    ####### STAGE 1 TOLERANCE ########

    context 'when there is a count error of -1' do
      let(:no_knowledge) { 9 }

      it 'Is inside the TOLERANCE & returns TRUE' do
        expect(checker.valid_participation?).to eq(true)
      end

    end

    context 'when there is a count error of +1' do
      let(:no_knowledge) { 11 }

      it 'Is inside the TOLERANCE & returns TRUE' do
        expect(checker.valid_participation?).to eq(true)
      end

    end

    ####### STAGE 2 MISSING COUNTS ########

    context 'when I forget to count people with knowledge' do
      let(:knowledge) { nil }

      it 'Is outside the TOLERANCE & returns FALSE' do
        expect(checker.valid_participation?).to eq(false)
      end
    end

    context 'when I forget to count people with no knowledge' do
      let(:no_knowledge) { nil }

      it 'Is outside the TOLERANCE & returns FALSE' do
        expect(checker.valid_participation?).to eq(false)
      end
    end


    context 'when there is no audience count' do
      let(:audience_count) { nil }

      it 'returns Paul, Why are you here if there is no audience' do
        expect(checker.valid_participation?).to eq('Paul, You forgot to count the audience total!')
      end
    end

    context 'when there is no speaker' do
      let(:speaker_count) { nil }

      it 'returns Audience, the speaker could not make it!' do
        expect(checker.valid_participation?).to eq('Audience, the speaker could not make it!')
      end
    end



    # No knowledge people are shy
    context 'when participation count is outside of the TOLERANCE' do
      let(:no_knowledge) { 5 }

      it 'Is outside the TOLERANCE & returns FALSE' do
        expect(checker.valid_participation?).to eq(false)
      end
    end

    #knowledge people are modest
    context 'when participation count is outside of the TOLERANCE' do
      let(:knowledge) { 5 }

      it 'Is outside the TOLERANCE & returns FALSE' do
        expect(checker.valid_participation?).to eq(false)
      end
    end


    context 'when audience count is not Integer' do
      let(:audience_count) { '20' }

      it 'returns false' do
        expect(checker.valid_participation?).to eq("Don't give me rubbish")
      end
    end

    context 'when knowledge count is not Integer' do
      let(:knowledge) { '10' }

      it 'returns false' do
        expect(checker.valid_participation?).to eq("Don't give me rubbish")
      end
    end

    context 'when NO knowledge count is not Integer' do
      let(:no_knowledge) { '10' }

      it 'returns false' do
        expect(checker.valid_participation?).to eq("Don't give me rubbish")
      end
    end

    context 'when SPEAKER_COUNT count is not Integer' do
      let(:speaker_count) { '1' }

      it 'returns false' do
        expect(checker.valid_participation?).to eq("Don't give me rubbish")
      end
    end
  end
end
