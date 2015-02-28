class Question < ActiveRecord::Base
  belongs_to :game
  paginates_per 10
  include PgSearch
  pg_search_scope :search_by_text,
                  against: :text,
                  using: {
                    tsearch: { prefix: true }
                  }
end