class Proposal < ActiveRecord::Base
  attr_accessible :title, :official_url, :proposal_type, :proposed_at, 
                  :category_name, :proposer_name, :official_resolution, :closed_at
end
