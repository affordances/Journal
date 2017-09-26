class Tag < ApplicationRecord
  validates :name, uniqueness: true

  has_many :taggings, dependent: :destroy
  has_many :articles, through: :taggings
end
