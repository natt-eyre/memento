class EmptyUserStats
  def initialize(user)
    @user = user
  end

  def entries_count
    0
  end

  def words_count
    0
  end

  def letters_count
    0
  end

  def most_frequent_words(number)
    []
  end

  def average_entry_length_chars
    0
  end

  def average_entry_length_words
    0
  end

  def longest_streak
    0
  end
end
