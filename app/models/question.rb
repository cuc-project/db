class Question < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_text,
                  against: :text,
                  using: {
                    tsearch: { prefix: true }
                  }
end