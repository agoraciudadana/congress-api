class AddBodyToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :body, :text
  end
end
