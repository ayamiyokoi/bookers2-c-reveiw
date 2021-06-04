class AddContent2ToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :content, :text
  end
end
