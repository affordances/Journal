class ArticlesController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret",
  #                              except: [:index, :show]

  before_action :cancel, only: [:create, :update]

  def cancel
    if params[:commit] == 'Cancel'
      if params[:id]
        @article = Article.find(params[:id])
        render 'update'
      else
        redirect_to action: 'index'
      end
    end
  end

  def index
    @articles = Article.all.order('created_at DESC').all

    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      respond_to do |format|
        format.html {}
        format.js {}
      end
    else
      redirect_to action: 'index'
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html {
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
      }
      format.js {
        @article.update(article_params)
      }
    end
  end

  def destroy
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html {
        @article.destroy

        redirect_to articles_path
      }
      format.js {
        @article.destroy
      }
    end
  end

  private

  def article_params
    params.require(:article).permit(:text, :all_tags)
  end
end
