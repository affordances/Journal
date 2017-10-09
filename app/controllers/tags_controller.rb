class TagsController < ApplicationController

  def show
    @tag = Tag.find_by_name(params[:tag])
    @articles = @tag.articles

    @archive = Article.all.order("created_at DESC").
      group_by { |article| article.created_at.strftime("%Y") }
  end

  def update
    @article = Article.find(params[:id])

    @article.update(article_params)

    @tag = Tag.find_by_name(params[:tag])
    @articles = @tag.articles
    render 'show'
  end

  private

  def article_params
    params.require(:article).permit(:text, :all_tags)
  end
end