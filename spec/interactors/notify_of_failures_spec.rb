require "rails_helper"

RSpec.describe NotifyOfFailures do
  let(:league) { FactoryBot.create(:league, api_id: 2)}
  let(:context) { NotifyOfFailures }

  before do
    stub_request(:get, "https://api-football-v1.p.rapidapi.com/v2/leagueTable/2").to_return(status: 400)
  end

  def failed_interactor
    result = FetchStandings.call(league: league)
    context.call(failures: [result])
  end

  it "succeeds" do
    expect(failed_interactor).to be_a_success
  end

  it "sends an email" do
    expect { failed_interactor }.to change { ActionMailer::Base.deliveries.count }.by 1
  end
end
