require "rails_helper"

RSpec.describe FailureMailer, type: :mailer do
  let(:league) { FactoryBot.create(:league, api_id: 2)}
  let(:failed_interactor) do
    result = FetchStandings.call(league: league)
    NotifyOfFailures.call(failures: [result])
  end
  let(:mail) { FailureMailer.notify(failed_interactor).deliver_now }

  before do
    stub_request(:get, "https://api-football-v1.p.rapidapi.com/v2/leagueTable/2").to_return(status: 400)
  end



  describe "notify" do
    it "renders the subject" do
      expect(mail.subject).to eq "Failed to fetch standings"
    end

    it "renders the receiver email" do
      expect(mail.to).to eq [ENV["admin_email"]]
    end

    it "renders the sender email" do
      expect(mail.from).to eq ["noreply@football_leaders.com"]
    end
  end
end
