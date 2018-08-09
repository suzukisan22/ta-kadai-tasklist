class AddColumnToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :user_id, :integer, after: "id"
  end
end
