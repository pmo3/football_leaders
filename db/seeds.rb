countries = [
  {
    name: "England",
    top_league: "Premier League",
    lat: 52.3555,
    lng: -1.1743,
    size: 40
  },
  {
    name: "France",
    top_league: "Ligue 1",
    lat: 46.2276,
    lng: 2.2137,
    size: 40
  }
]

countries.each do |data|
  country = Country.first_or_create(data.except(:size))
  MapItem.first_or_create(country: country, size: data[:size])
end
