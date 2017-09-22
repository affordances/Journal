module ArticlesHelper
  def tag_links(tags)
    tags.map { |tag| link_to '#' + tag, tag_path(tag) }.join(' ')
  end
end
