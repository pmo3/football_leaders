class RankingBlueprint < Blueprinter::Base
  fields :points, :rank
  association :team, blueprint: TeamBlueprint
end
