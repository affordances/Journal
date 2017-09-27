class Tag < ApplicationRecord
  validates :name, presence: true, allow_blank: false, uniqueness: true

  has_many :taggings, dependent: :destroy
  has_many :articles, through: :taggings
end
