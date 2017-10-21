module ArticlesHelper
  def tag_links(tags)
    tags.map { |tag| link_to tag, tag_path(tag), remote: true }.join('&nbsp;&nbsp;')
  end
end
