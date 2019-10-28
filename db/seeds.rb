countries = [
  {
    country: "England",
    name: "Premier League",
    geo_country: "United Kingdom",
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
    lat: 42.8719,
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
    name: "Primeira Liga",
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
    lng: 16.6435,
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
  }, {
    country: "Denmark",
    name: "Superligaen",
    lat: 56.2639,
    lng: 9.5018,
    size: 30
  }, {
    country: "Poland",
    name: "Ekstraklasa",
    lat: 51.9194,
    lng: 19.1451,
    size: 40
  }, {
    country: "Czech-Republic",
    name: "Czech Liga",
    lat: 49.8175,
    lng: 15.4730,
    size: 30
  }, {
    country: "Austria",
    name: "Tipp3 Bundesliga",
    lat: 47.5162,
    lng: 14.5501,
    size: 35
  }, {
    country: "Slovenia",
    name: "1. SNL",
    lat: 46.1512,
    lng: 14.9955,
    size: 20
  }, {
    country: "Croatia",
    name: "Prva HNL",
    lat: 44.1000,
    lng: 15.2000,
    size: 20
  }, {
    country: "Slovakia",
    name: "Super Liga",
    lat: 48.9690,
    lng: 19.6990,
    size: 25
  }, {
    country: "Hungary",
    name: "NB I",
    lat: 47.1625,
    lng: 19.5033,
    size: 25
  }, {
    country: "Serbia",
    name: "Super Liga",
    lat: 44.0165,
    lng: 21.0059,
    size: 30
  }, {
    country: "Greece",
    name: "Super League",
    lat: 39.0742,
    lng: 21.8243,
    size: 40
  }, {
    country: "Bulgaria",
    name: "A PFG",
    lat: 42.7339,
    lng: 25.4858,
    size: 35
  }, {
    country: "Romania",
    name: "Liga I",
    lat: 45.9432,
    lng: 24.9668,
    size: 40
  }, {
    country: "Ukraine",
    name: "Premier League",
    lat: 48.3794,
    lng: 31.1656,
    size: 40
  }, {
    country: "Belarus",
    name: "Vyscha Liga",
    lat: 53.7098,
    lng: 27.9534,
    size: 35
  }, {
    country: "Russia",
    name: "Premier League",
    lat: 56.9343,
    lng: 33.3351,
    size: 45
  }
]

countries.each do |data|
  league = League.where(data.except(:size)).first_or_create
  MapItem.where(league: league, size: data[:size]).first_or_create
end
