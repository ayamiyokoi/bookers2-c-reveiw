class RemoveContentFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :Content, :text
  end
end
