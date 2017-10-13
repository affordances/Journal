# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.'

tags = ['#good', '#bad', '#up', '#down', '#right', '#left',
        '#fast', '#slow', '#inside', '#outside']

tags.each do |tag|
  Tag.create(name: tag)
end

articles_count = 100

articles_count.times do
  article = Article.create(text: text)
  article.update_attribute :created_at, (rand * 2000).days.ago
end

articles_count.times do
  article = rand(articles_count)
  tag = rand(10)

  if !Tagging.find_by(article_id: article, tag_id: tag)
    Tagging.create(article_id: article, tag_id: tag)
  end
end
