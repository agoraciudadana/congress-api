class ChangeOfficalResolutionForStatus < ActiveRecord::Migration
  def change
    rename_column :proposals, :official_resolution, :status
  end
end
