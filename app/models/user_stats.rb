class UserStats
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

  private

  def user_entries
    @user.entries
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
end
