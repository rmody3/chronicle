class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
      rename_column :chronicles, :type, :visibility
  end
end
