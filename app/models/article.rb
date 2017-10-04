class Article < ApplicationRecord
  validates :text, presence: true, allow_blank: false

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def all_tags=(names)
    new_tags = names.split(' ').map do |name|
      if name[0] != '#'
        name = '#' + name
      end
      Tag.where(name: name.strip).first_or_create!
    end

    leftover_tags = self.tags - new_tags
    leftover_tags.each do |tag|
      Tagging.find_by(article_id: self.id, tag_id: tag.id).destroy
    end

    self.tags = new_tags
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
