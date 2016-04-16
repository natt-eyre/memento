module ApplicationHelper
  def pluralize_without_count(count, noun, text = nil)
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
  end
end
