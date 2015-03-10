class Game < ActiveRecord::Base
  has_many :questions

  default_scope { order('date DESC') }
end
