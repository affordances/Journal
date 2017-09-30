class Article < ApplicationRecord
  validates :text, presence: true, allow_blank: false

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def all_tags=(names)
    self.tags = names.split(' ').map do |name|
      if name[0] != '#'
        name = '#' + name
      end
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags = self.tags.map(&:name)
    tags.empty? ? tags : tag_spacer(tags)
    tags
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end

  def tag_spacer(tags)
    tags.map! { |tag| tag + ' ' }
    tags[-1] += ' '
    tags
  end
end
