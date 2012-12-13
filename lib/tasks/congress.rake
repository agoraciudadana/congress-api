namespace :congress do
  desc "basic rake task to get up and running"
  task :setup => :environment do
    Rake::Task['db:migrate'].invoke
    Rake::Task['scrapper:scrape'].invoke
  end
end