class UserStats
  require 'facets'
  
  def initialize(user)
    @user = user
  end

  def entries_count
    user_entries.count
  end

  def words_count
    words = get_all_words
    words.count
  end

  def letters_count
    get_all_words.inject(0) { |sum, word| sum + word.length }
  end

  def most_frequent_words(number)
    frequency_count.first(number)
  end

  def average_entry_length_chars
    letters_count / entries_count
  end

  def average_entry_length_words
    words_count / entries_count
  end

  def longest_streak
    streak = 1
    streaks = []
    dates = user_entries.map{ |entry| entry.target_date.to_date }
    dates.each_index do |i|
      if dates[i+1] - dates[i] == 1
        streak += 1
      elsif (dates[i+1] - dates[i]) > 1
        streaks << streak
        streak = 1
      end
      if (i + 2) == dates.size
        streaks << streak
        return streaks.max
      end
    end
  end

  private

  def user_entries
    @user_entries ||= @user.entries
  end

  def get_all_words
    @all_words ||=
    begin
      contents = ""
      user_entries.each do |entry|
        contents << (" " + entry.content)
      end
      if contents.empty?
        []
      else
        text = Nokogiri::HTML(contents).at('body').inner_text
        text.scan(/[[:word:]]+/)
      end
    end
  end

  def frequency_count
    get_all_words.frequency.sort_by{ |k, v| v }.reverse
  end
end
