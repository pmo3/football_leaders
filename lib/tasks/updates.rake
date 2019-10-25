namespace :update do
  desc "fetch and update league/standings info"
  task api: :environment do
    leagues = FetchLeagues.call
    leagues.top_leagues.each do |league|
      UpdateStandings.call(league: league)
    end
  end
end
