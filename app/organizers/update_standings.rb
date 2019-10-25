class UpdateStandings
  include Interactor::Organizer

  organize FetchStandings, AddStandingsToDatabase
end
