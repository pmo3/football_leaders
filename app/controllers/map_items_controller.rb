class MapItemsController < ApplicationController
  def index
    @map_items = MapItem.all
    @json = MapItemBlueprint.render_as_json @map_items
    render json: @json, status: 200
  end
end
