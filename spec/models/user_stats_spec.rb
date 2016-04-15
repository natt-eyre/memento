require 'rails_helper'
require 'facets'

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

  describe "#words_count" do
    it "count words in entries" do
      user = create(:user)
      2.times do
        create(:entry, user: user, content: "good день")
      end
      stats = UserStats.new(user)
      expect(stats.words_count).to eq(4)
    end
  end

  describe "#letters_count" do
    it "count letters in words" do
      user = create(:user)
      2.times do
        create(:entry, user: user, content: "good day")
      end
      stats = UserStats.new(user)
      expect(stats.letters_count).to eq(14)
    end
  end

  describe "#most_frequent_words" do
    it "lists most popular words with frequency" do
      user = create(:user)
      3.times do
        create(:entry, user: user, content: "good")
      end
      2.times do
        create(:entry, user: user, content: "bad")
      end
      create(:entry, user: user, content: "day")
      stats = UserStats.new(user)
      expect(stats.most_frequent_words(2)).to eq([ ["good", 3], ["bad", 2]])
    end
  end

  describe "longest_streak" do
    it "count max days in a row" do
      user = create(:user)
      create(:entry, user: user, target_date: Time.now - 4.days)
      create(:entry, user: user, target_date: Time.now - 2.days)
      create(:entry, user: user, target_date: Time.now - 1.day)
      create(:entry, user: user, target_date: Time.now)
      create(:entry, user: user, target_date: Time.now)
      stats = UserStats.new(user)
      expect(stats.longest_streak).to eq(3)
    end
  end
end
