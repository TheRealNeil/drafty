class AddDraftsToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :draft_id, :integer
    add_column :activities, :published_at, :timestamp
    add_column :activities, :trashed_at, :timestamp
  end
end
