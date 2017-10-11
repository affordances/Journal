class MonthsController < ApplicationController
  def show
    @archive = Article.all.order("created_at DESC").
      group_by { |article| article.created_at.strftime("%Y") }
  end

  private

  def article_params
    params.require(:article).permit(:text, :all_tags)
  end
end
