class SearchController < ApplicationController
  layout "search"
  def index
    @count = Question.count
    @last_sync_date = Question.first.created_at
  end

  def search
    @terms   = sanitize_terms(params["query"])
    @results = Question.search_by_text(@terms).page(params[:page])
    @count   = Question.count
    @last_sync_date = Question.first.created_at
    render :results
  end

  private

  def sanitize_terms(str)
    str.split(" ").reject{ |term| term.size < 3 }
  end
end
