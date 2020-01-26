class Note < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :tag_notes, dependent: :destroy
  has_many :tags,  through:  :tag_notes
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  def self.search(search)
    if search
      Note.where('title LIKE(?)', "%#{search}%")
    else
      Note.all
    end
  end

end
