namespace :update do
  desc "fetch and update league/standings info"
  task api: :environment do
    leagues = FetchLeagues.call
    failures = []
    leagues.top_leagues.each do |league|
      result = UpdateStandings.call(league: league)
      unless result.success?
        failures << result
      end
      sleep 1
    end
  end

  desc "fetch and assign team colors"
  task colors: :environment do
    leagues = League.all
    leagues.each do |league|
      leader = league.rankings.league_leader.team
      SetTeamColor.call(team: leader)
    end
  end
end
