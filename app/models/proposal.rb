class Proposal < ActiveRecord::Base
  attr_accessible :title, :body, :official_url, :proposal_type, :proposed_at, 
                  :category_name, :proposer_name, :status, :closed_at
end
