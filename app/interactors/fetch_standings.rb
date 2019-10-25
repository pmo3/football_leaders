class FetchStandings
  include Interactor
  def call
    response = FootballApiService.new.get_standings_json_for context.league.api_id
    if response.code.to_s == "200" && JSON.parse(response.body)["api"]["standings"].present?
      context.standings_json = JSON.parse(response.body)["api"]["standings"].first
    else
      context.fail!(message: "Failed to fetch standings json", code: response.code)
    end
  end
end
