namespace :congress do
  desc "Basic rake task to get up and running"
  task :setup => :environment do
    Rake::Task['db:migrate'].invoke
    Rake::Task['congress:update'].invoke
  end

  desc "Update data from congreso.es"
  task :update => :environment do
    Congress::Scrapper.scrape.each do |proposal_attrs|
      proposal = Proposal.find_or_create_by_title(proposal_attrs[:title])
      proposal.update_attributes!(proposal_attrs)
    end
  end
end