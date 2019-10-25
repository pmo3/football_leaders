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
    end
  end
end
