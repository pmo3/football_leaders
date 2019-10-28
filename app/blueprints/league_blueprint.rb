class LeagueBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :lat, :lng
  field :normalized_country, name: :country
  association :standings, blueprint: RankingBlueprint do |league|
    league.current_standings
  end
end
