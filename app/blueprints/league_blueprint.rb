class LeagueBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :country, :lat, :lng
  association :standings, blueprint: RankingBlueprint do |league|
    league.current_standings
  end
end
