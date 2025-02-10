require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to(:question) }
  it { should have_many(:user_answers).dependent(:destroy) }

  it "is invalid without text" do
    answer = build_stubbed(:correct_answer, text: nil)
    expect(answer).not_to be_valid
  end

  it "is invalid unless it specifies whether it's the correct answer" do
    answer = build_stubbed(:answer, correct: nil)
    expect(answer).not_to be_valid
  end

  it "defaults times_guessed to 0" do
    answer = build_stubbed(:answer)
    expect(answer.times_guessed).to eq(0)
  end
end
