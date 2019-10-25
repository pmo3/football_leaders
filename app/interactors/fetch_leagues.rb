require 'json'

class FetchLeagues
  include Interactor

  def call
    response = FootballApiService.new.get_leagues_json
    if response.code.to_s == "200" && JSON.parse(response.body)["api"]["leagues"].present?
      context.json = JSON.parse(response.body)["api"]["leagues"]
      context.top_leagues = top_leagues context.json
    else
      context.fail!(message: "Failed to fetch leagues json", code: response.code)
    end
  end

  private

  def top_leagues(json)
    leagues = []
    countries = League.by_country
    json.each do |league|
      country_name = league["country"]
      if country_name == "France"
        byebug
      end
      next unless countries[country_name]
      top_league = countries[country_name].first
      if league["name"] == top_league.name
        top_league.api_id = league["league_id"]
        leagues << top_league
      end
    end
    leagues
  end
end
