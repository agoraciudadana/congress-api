namespace :scrapper do
  desc "Update data from congreso.es"
  task :scrape => :environment do
    Congress::Scrapper.scrape.each do |proposal_attrs|
      proposal = Proposal.find_or_create_by_title(proposal_attrs[:title])
      proposal.update_attributes!(proposal_attrs)
    end
  end
end