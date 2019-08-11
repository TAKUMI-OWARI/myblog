class NewsweeksController < ApplicationController

  def index
    NewsweekScrapingJobJob.perform_later
    @newsweeks = Newsweek.order('id ASC').page(params[:page]).per(20)
  end

  def new
  end

  def search_title
    @newsweeks = Newsweek.where('title LIKE(?)',"%#{params[:keyword]}%").order('id ASC')
    respond_to do |format|
      format.html
      format.json
    end
  end

  def search_category
    @newsweeks = Newsweek.where('category LIKE(?)',"%#{params[:keyword]}%").order('id ASC')
    respond_to do |format|
      format.html
      format.json
    end
  end

  def test_1
  end
end
