class AddStandingsToDatabase
  include Interactor

  def call
    context.standings_json.each do |team|
      db_team = Team.where(name: team["teamName"], logo_url: team["logo"], league: context.league).first_or_create
      ranking = Ranking.create({
        team: db_team,
        league: context.league,
        date: Date.today,
        rank: team["rank"],
        points: team["points"]
      })
    end
  end
end
