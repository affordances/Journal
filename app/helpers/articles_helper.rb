module ArticlesHelper
  def tag_links(tags)
    tags.map { |tag| link_to tag, root_path(tag: tag), remote: true }.join('&nbsp;&nbsp;')
  end
end

# onclick: 'limitByTag("' + tag + '")',
