class RemoveColumnNameFromTableName < ActiveRecord::Migration
  def change
    remove_column :joins, :description, :string
    # remove_column :joins, :name, :string
  end
end
