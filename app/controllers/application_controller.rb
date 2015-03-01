include ActionView::Helpers::DateHelper

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :question_count, :last_sync_date
  protect_from_forgery with: :exception

  private

  def question_count
    Question.count
  end

  def last_sync_date
    time_ago_in_words Question.first.created_at
  end
end
