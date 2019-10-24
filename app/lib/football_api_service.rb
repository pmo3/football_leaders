require "net/http"
require "uri"

class FootballApiService

  BASE_URL = "https://api-football-v1.p.rapidapi.com/v2".freeze

  def get_leagues_json(season="2019")
    response = request leagues_url
  end

  def get_standings_json_for league_id
    response = request standings_url(league_id)
  end

  private

  def api_key
    ENV["rapidapi_key"]
  end

  def leagues_url(season="2019")
    "#{BASE_URL}/leagues/season/#{season}"
  end

  def standings_url league_id
    "#{BASE_URL}/leagueTable/#{league_id}"
  end

  def request(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri, headers)
    response = http.request(request)
  end

  def headers
    { "x-rapidapi-key" => api_key }
  end
end
