class AddColumnToTask < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :user, foreign_key: true, after: "id"
  end
end
