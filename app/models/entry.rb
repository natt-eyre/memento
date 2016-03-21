class Entry < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :content
  validates_presence_of :target_date

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "253x200#" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  
  include PgSearch
  pg_search_scope :search_by_content, :against => [:content]
end
