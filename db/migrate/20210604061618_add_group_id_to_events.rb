class AddGroupIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :group_id, :string
  end
end
