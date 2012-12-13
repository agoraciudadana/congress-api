class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string    "title",               :limit => 1024
      t.string    "official_url",        :limit => 1024
      t.string    "proposal_type"
      t.string    "official_resolution"
      t.string    "category_name"
      t.string    "proposer_name"
      t.date      "proposed_at"
      t.date      "closed_at"
      t.timestamps
    end
  end
end
