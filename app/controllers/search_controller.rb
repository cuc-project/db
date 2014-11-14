class SearchController < ApplicationController
  layout "search"
  def index
    @count = Question.count
  end

  def search
    @terms   = sanitize_terms(params["query"])
    @results = Question.search_by_text(@terms).page(params[:page])
    @count   = Question.count
    render :results
  end

  private

  def sanitize_terms(str)
    str.split(" ").reject{ |term| term.size < 3 }
  end
end