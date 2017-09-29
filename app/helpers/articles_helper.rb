module ArticlesHelper
  def tag_links(tags)
    tags.map { |tag| link_to tag, tag_path(tag), onclick: 'limitByTag("' + tag + '")' }.join('  ')
  end
end
