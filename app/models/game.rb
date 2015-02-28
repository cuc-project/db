class Game < ActiveRecord::Base
  has_many :questions

  default_scope { order('date DESC') }
  def title
    if season
      str = "C#{date.year}#{season[0]} etapa #{tour}"
    else
      str = "#{competition} #{date.year} #{cup_name} #{elitar_name}"
    end
    str += " (#{authors})" if authors
    str
  end
end