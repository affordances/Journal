class RemoveTitles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :title
  end
end
