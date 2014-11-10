class Question < ActiveRecord::Base
  paginates_per 2
  include PgSearch
  pg_search_scope :search_by_text,
                  against: :text,
                  using: {
                    tsearch: { prefix: true }
                  }
end