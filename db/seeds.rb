# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a1 = Article.create(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.')
a2 = Article.create(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.')
a3 = Article.create(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.')
a4 = Article.create(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.')
a5 = Article.create(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.')
a6 = Article.create(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.')
a7 = Article.create(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.')
a8 = Article.create(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.')
a9 = Article.create(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.')
a10 = Article.create(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id velit odio. Aliquam a euismod risus, id gravida dui. Nullam interdum bibendum nunc. Fusce molestie mi eu sodales iaculis. Quisque nec nunc turpis. Integer dignissim ipsum vel quam ornare condimentum. Aliquam erat volutpat. Pellentesque facilisis tristique libero vitae luctus. Quisque consequat congue leo vel porta. Ut lorem tortor, blandit vel semper et, venenatis id diam.')

a1.update_attribute :created_at, (rand*1000).days.ago
a2.update_attribute :created_at, (rand*1000).days.ago
a3.update_attribute :created_at, (rand*1000).days.ago
a4.update_attribute :created_at, (rand*1000).days.ago
a5.update_attribute :created_at, (rand*1000).days.ago
a6.update_attribute :created_at, (rand*1000).days.ago
a7.update_attribute :created_at, (rand*1000).days.ago
a8.update_attribute :created_at, (rand*1000).days.ago
a9.update_attribute :created_at, (rand*1000).days.ago
a10.update_attribute :created_at, (rand*1000).days.ago

Tag.create(name: '#good')
Tag.create(name: '#bad')
Tag.create(name: '#up')
Tag.create(name: '#down')
Tag.create(name: '#right')
Tag.create(name: '#left')
Tag.create(name: '#fast')
Tag.create(name: '#slow')
Tag.create(name: '#inside')
Tag.create(name: '#outside')

Tagging.create(article_id: 1, tag_id: 1)
Tagging.create(article_id: 1, tag_id: 3)
Tagging.create(article_id: 1, tag_id: 6)
Tagging.create(article_id: 2, tag_id: 2)
Tagging.create(article_id: 2, tag_id: 5)
Tagging.create(article_id: 3, tag_id: 4)
Tagging.create(article_id: 3, tag_id: 6)
Tagging.create(article_id: 3, tag_id: 1)
Tagging.create(article_id: 4, tag_id: 7)
Tagging.create(article_id: 4, tag_id: 8)
Tagging.create(article_id: 4, tag_id: 9)
Tagging.create(article_id: 5, tag_id: 9)
Tagging.create(article_id: 5, tag_id: 7)
Tagging.create(article_id: 1, tag_id: 1)
Tagging.create(article_id: 1, tag_id: 6)
Tagging.create(article_id: 2, tag_id: 7)
Tagging.create(article_id: 2, tag_id: 9)
Tagging.create(article_id: 2, tag_id: 8)
Tagging.create(article_id: 8, tag_id: 10)
