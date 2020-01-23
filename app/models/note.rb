class Note < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments
  has_many  :tags,  through:  :tag_notes

  def self.search(search)
    if search
      Note.where('title LIKE(?)', "%#{search}%")
    else
      Note.all
    end
  end

end
