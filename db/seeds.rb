# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'guest@website.com', password: 'password')

text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.'

# tags = ['#good', '#bad', '#up', '#down', '#right', '#left',
#         '#fast', '#slow', '#inside', '#outside']

tags = ['#latin', '#extremely_latin', '#very_latin']

tags.each do |tag|
  Tag.create(name: tag)
end

articles_count = 100
time_ago = 2000

articles_count.times do
  article = Article.create(author_id: 1, text: text)
  article.update_attribute :created_at, time_ago.days.ago
  time_ago -= 20
end

while articles_count > 0
  article = articles_count

  if articles_count % 3 == 0
    Tagging.create(article_id: article, tag_id: 1)
  end

  if articles_count % 7 == 0
    Tagging.create(article_id: article, tag_id: 2)
  end

  if articles_count % 9 == 0
    Tagging.create(article_id: article, tag_id: 3)
  end

  articles_count -= 1
end

# if !Tagging.find_by(article_id: article, tag_id: tag)
#   Tagging.create(article_id: article, tag_id: tag)
# end
