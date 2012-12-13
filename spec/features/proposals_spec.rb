require 'spec_helper'

feature "Proposals"  do

  background do
    create :proposal, 
           :title               => "Proposal for the right to a house",
           :official_url        => "http://congreso.es/proposal/1",
           :proposal_type       => "Constitutional",
           :official_resolution => "Accepted",
           :category_name       => "Civil Rights",
           :proposer_name       => "Spain",
           :proposed_at         => 1.month.ago,
           :closed_at           => Chronic.parse(Date.yesterday)

    create :proposal, 
           :title               => "Proposal for the right to work",
           :official_url        => "http://congreso.es/proposal/2",
           :proposal_type       => "Constitutional",
           :official_resolution => "In progress",
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
      page.should have_css "a", "http://congreso.es/proposal/1"
      page.should have_content "Constitutional"
      page.should have_content "Accepted"
      page.should have_content "Civil Rights"
      page.should have_content "Spain"
      page.should have_content 1.month.ago.to_date
      page.should have_content Chronic.parse(Date.yesterday).to_date
    end

  end


  context "JSON" do

    scenario "index" do
      visit "/proposals.json"
      proposals = JSON.parse(page.source)

      housing = proposals.first
      housing['title'].should               == "Proposal for the right to a house"
      housing['official_url'].should        == "http://congreso.es/proposal/1"
      housing['proposal_type'].should       == "Constitutional"
      housing['official_resolution'].should == "Accepted"
      housing['category_name'].should       == "Civil Rights"
      housing['proposer_name'].should       == "Spain"
      housing['proposed_at'].should         == 1.month.ago.strftime("%Y-%m-%d")
      housing['closed_at'].should           == Chronic.parse(Date.yesterday).strftime("%Y-%m-%d")

      work = proposals.second
      work['title'].should               == "Proposal for the right to work"
      work['official_url'].should        == "http://congreso.es/proposal/2"
      work['proposal_type'].should       == "Constitutional"
      work['official_resolution'].should == "In progress"
      work['category_name'].should       == "Work Rights"
      work['proposer_name'].should       == "Spain"
      work['proposed_at'].should         == 2.months.ago.strftime("%Y-%m-%d")
      work['closed_at'].should           == nil
    end

    scenario "show" do
      visit "/proposals/1.json"
      proposal = JSON.parse(page.source)

      proposal['title'].should               == "Proposal for the right to a house"
      proposal['official_url'].should        == "http://congreso.es/proposal/1"
      proposal['proposal_type'].should       == "Constitutional"
      proposal['official_resolution'].should == "Accepted"
      proposal['category_name'].should       == "Civil Rights"
      proposal['proposer_name'].should       == "Spain"
      proposal['proposed_at'].should         == 1.month.ago.strftime("%Y-%m-%d")
      proposal['closed_at'].should           == Chronic.parse(Date.yesterday).strftime("%Y-%m-%d")
    end
  end

  context "XML" do

    scenario "index" do
      visit "/proposals.xml"
      proposals = Hash.from_xml(page.source)['proposals']

      housing = proposals.first
      housing['title'].should               == "Proposal for the right to a house"
      housing['official_url'].should        == "http://congreso.es/proposal/1"
      housing['proposal_type'].should       == "Constitutional"
      housing['official_resolution'].should == "Accepted"
      housing['category_name'].should       == "Civil Rights"
      housing['proposer_name'].should       == "Spain"
      housing['proposed_at'].should         == 1.month.ago.to_date
      housing['closed_at'].should           == Chronic.parse(Date.yesterday).to_date

      work = proposals.second
      work['title'].should               == "Proposal for the right to work"
      work['official_url'].should        == "http://congreso.es/proposal/2"
      work['proposal_type'].should       == "Constitutional"
      work['official_resolution'].should == "In progress"
      work['category_name'].should       == "Work Rights"
      work['proposer_name'].should       == "Spain"
      work['proposed_at'].should         == 2.months.ago.to_date
      work['closed_at'].should           == nil
    end

    scenario "show" do
      visit "/proposals.xml"
      proposal = Hash.from_xml(page.body)['proposals'].first

      proposal['title'].should               == "Proposal for the right to a house"
      proposal['official_url'].should        == "http://congreso.es/proposal/1"
      proposal['proposal_type'].should       == "Constitutional"
      proposal['official_resolution'].should == "Accepted"
      proposal['category_name'].should       == "Civil Rights"
      proposal['proposer_name'].should       == "Spain"
      proposal['proposed_at'].should         == 1.month.ago.to_date
      proposal['closed_at'].should           == Chronic.parse(Date.yesterday).to_date
    end  

  end    
end