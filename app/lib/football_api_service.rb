require "net/http"
require "uri"

class FootballApiService

  BASE_URL = "https://api-football-v1.p.rapidapi.com/v2".freeze

  def get_leagues_json
    response = request leagues_url
    response.body
  end

  def get_standings_json_for league_id
    response = request standings_url(league_id)
    response.body
  end

  private

  def api_key
    ENV["rapidapi_key"]
  end

  def leagues_url
    "#{BASE_URL}/leagues"
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
