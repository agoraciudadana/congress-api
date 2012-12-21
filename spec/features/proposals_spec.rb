require 'spec_helper'

feature "Proposals"  do

  background do
    create :proposal, 
           :title               => "Proposal for the right to a house",
           :body                => "The right to a safe home is essential to every human",
           :official_url        => "http://congreso.es/proposal/1",
           :proposal_type       => "Constitutional",
           :status              => "Accepted",
           :category_name       => "Civil Rights",
           :proposer_name       => "Spain",
           :proposed_at         => 1.month.ago,
           :closed_at           => Chronic.parse(Date.yesterday)

    create :proposal, 
           :title               => "Proposal for the right to work",
           :body                => "The right to fulfilling job is essential to every human",
           :official_url        => "http://congreso.es/proposal/2",
           :proposal_type       => "Constitutional",
           :status              => "In progress",
           :category_name       => "Work Rights",
           :proposer_name       => "Spain",
           :proposed_at         => 2.months.ago,
           :closed_at           => nil
  end

  context "HTML" do

    scenario "index" do
      visit "/proposals"
      
      page.should have_content "Proposal for the right to a house"
      page.should have_content "Proposal for the right to work"
    end

    scenario "show" do
      visit "/proposals"
      click_link "Proposal for the right to a house"
      
      page.should have_content "Proposal for the right to a house"
      page.should have_content "The right to a safe home is essential to every human"
      page.should have_css     "a", "http://congreso.es/proposal/1"
      page.should have_content "Constitutional"
      page.should have_content "Accepted"
      page.should have_content "Civil Rights"
      page.should have_content "Spain"
      page.should have_content I18n.l 1.month.ago.to_date
      page.should have_content I18n.l Chronic.parse(Date.yesterday).to_date
    end

  end


  context "JSON" do

    scenario "index" do
      visit "/proposals.json"
      proposals = JSON.parse(page.source)

      housing = proposals.first
      housing['title'].should               == "Proposal for the right to a house"
      housing['body'].should                == "The right to a safe home is essential to every human"
      housing['official_url'].should        == "http://congreso.es/proposal/1"
      housing['proposal_type'].should       == "Constitutional"
      housing['status'].should              == "Accepted"
      housing['category_name'].should       == "Civil Rights"
      housing['proposer_name'].should       == "Spain"
      housing['proposed_at'].should         == 1.month.ago.strftime("%Y-%m-%d")
      housing['closed_at'].should           == Chronic.parse(Date.yesterday).strftime("%Y-%m-%d")

      work = proposals.second
      work['title'].should               == "Proposal for the right to work"
      work['body'].should                == "The right to fulfilling job is essential to every human"
      work['official_url'].should        == "http://congreso.es/proposal/2"
      work['proposal_type'].should       == "Constitutional"
      work['status'].should              == "In progress"
      work['category_name'].should       == "Work Rights"
      work['proposer_name'].should       == "Spain"
      work['proposed_at'].should         == 2.months.ago.strftime("%Y-%m-%d")
      work['closed_at'].should           == nil
    end

    scenario "show" do
      visit "/proposals/1.json"
      proposal = JSON.parse(page.source)

      proposal['title'].should               == "Proposal for the right to a house"
      proposal['body'].should                == "The right to a safe home is essential to every human"
      proposal['official_url'].should        == "http://congreso.es/proposal/1"
      proposal['proposal_type'].should       == "Constitutional"
      proposal['status'].should              == "Accepted"
      proposal['category_name'].should       == "Civil Rights"
      proposal['proposer_name'].should       == "Spain"
      proposal['proposed_at'].should         == 1.month.ago.strftime("%Y-%m-%d")
      proposal['closed_at'].should           == Chronic.parse(Date.yesterday).strftime("%Y-%m-%d")
    end
  end
    
end