class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviews, :text, :content
  end
end
