class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :responses, :type, :resp_type
  end
end
