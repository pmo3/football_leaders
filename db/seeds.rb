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
  }
]

countries.each do |data|
  league = League.first_or_create(data.except(:size))
  MapItem.first_or_create(league: league, size: data[:size])
end
