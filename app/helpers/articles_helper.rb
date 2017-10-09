module ArticlesHelper
  def tag_links(tags)
    tags.map { |tag| link_to tag, tag_path(tag) }.join('&nbsp;&nbsp;')
  end

  # def archive_links(months)
  #   months.map { |month| link_to month, month_path(month) }.join(' ')
  # end
end
