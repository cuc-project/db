class Question < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_in_questions,
                  against: :text,
                  using: {
                    tsearch: { prefix: true }
                  }
end