class MonthsController < ApplicationController
  def show
    @month = DateTime.strptime(params[:month], '%Y-%m')

    @articles = Article.where(created_at: @month...@month+1.month).
        order("created_at DESC")

    @archive = Article.all.order("created_at DESC").
      group_by { |article| article.created_at.strftime("%Y") }
  end

  private

  def article_params
    params.require(:article).permit(:text, :all_tags)
  end
end
