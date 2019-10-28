class AddGeoCountryToLeagues < ActiveRecord::Migration[6.0]
  def change
    add_column :leagues, :geo_country, :string
  end
end
