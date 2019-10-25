class MapItemBlueprint < Blueprinter::Base
  fields :size
  association :league, blueprint: LeagueBlueprint
  association :leader, blueprint: TeamBlueprint do |map_item|
    map_item.league.league_leader.try(:team)
  end
end
