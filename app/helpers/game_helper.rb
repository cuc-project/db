module GameHelper
  def game_title(game)
    if game.season
      str = "C#{game.date.year}#{game.season[0]} etapa #{game.tour}"
    else
      str = "#{game.competition} #{game.date.year} #{game.cup_name} #{game.elitar_name}"
    end
    str += " (#{truncate(game.authors, length: 60, separator: ",", omission: ", ...")})" if game.authors
    str
  end
end
