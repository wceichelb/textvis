class ChangeResponseTypeToString < ActiveRecord::Migration
  def change
    change_column :responses, :type, :string
  end
end
