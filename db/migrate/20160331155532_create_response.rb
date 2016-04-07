class CreateResponse < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :content
      t.integer :type
      t.references :email, index: true, foreign_key: true
    end
  end
end
