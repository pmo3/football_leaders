countries = [
  {
    country: "England",
    name: "Premier League",
    lat: 52.3555,
    lng: -1.1743,
    size: 40
  },
  {
    country: "France",
    name: "Ligue 1",
    lat: 46.2276,
    lng: 2.2137,
    size: 40
  }, {
    country: "Italy",
    name: "Serie A",
    lat: 41.8719,
    lng: 12.5674,
    size: 40
  }, {
    country: "Spain",
    name: "Primera Division",
    lat: 40.4637,
    lng: -3.7492,
    size: 40
  }, {
    country: "Portugal",
    name: "Primeira",
    lat: 39.3999,
    lng: -8.2245,
    size: 25
  }, {
    country: "Norway",
    name: "Eliteserien",
    lat: 60.4720,
    lng: 8.4689,
    size: 30
  }, {
    country: "Sweden",
    name: "Allsvenskan",
    lat: 60.1282,
    lng: 18.6435,
    size: 30
  }, {
    country: "Finland",
    name: "Veikkausliiga",
    lat: 61.9241,
    lng: 25.7482,
    size: 30
  }, {
    country: "Ireland",
    name: "Premier Division",
    lat: 53.1424,
    lng: -7.6921,
    size: 20
  }, {
    country: "Belgium",
    name: "Jupiler Pro League",
    lat: 50.5039,
    lng: 4.4699,
    size: 25
  }, {
    country: "Netherlands",
    name: "Eredivisie",
    lat: 52.1326,
    lng: 5.2913,
    size: 20
  }, {
    country: "Germany",
    name: "Bundesliga 1",
    lat: 51.1657,
    lng: 10.4515,
    size: 40
  }, {
    country: "Switzerland",
    name: "Super League",
    lat: 46.8182,
    lng: 8.2275,
    size: 20
  }, {
    country: "Turkey",
    name: "Super Lig",
    lat: 38.9637,
    lng: 35.2433,
    size: 40
  }
]

countries.each do |data|
  league = League.where(data.except(:size)).first_or_create
  MapItem.where(league: league, size: data[:size]).first_or_create
end
