class SetTeamColor
  include Interactor

  def call
    team = context.team
    unless team.color.present?
      colors = Miro::DominantColors.new(team.logo_url)
      color = colors.to_hex.first
      unless team.update(color: color)
        context.fail!(message: "Something went wrong while assigning the color")
      end
    end
  end
end
