class RenameStatueColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :statue_id, :status_id
  end
end
