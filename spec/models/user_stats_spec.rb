require 'rails_helper'

RSpec.describe UserStats do
  describe "#entries_count" do
    it "count entries" do
      user = create(:user)
      2.times do
        create(:entry, user: user)
      end
      stats = UserStats.new(user)
      expect(stats.entries_count).to eq(2)
    end
  end

  describe "words_count" do
    it "count words in entries" do
      user = create(:user)
      2.times do
        create(:entry, user: user, content: "good день")
      end
      stats = UserStats.new(user)
      expect(stats.words_count).to eq(4)
    end
  end

  describe "letters_count" do
    it "count letters in words" do
      user = create(:user)
      2.times do
        create(:entry, user: user, content: "good day")
      end
      stats = UserStats.new(user)
      expect(stats.letters_count).to eq(14)
    end
  end

  # describe "longest_streak" do
  #   it "count max days in a row"
  # end
end
