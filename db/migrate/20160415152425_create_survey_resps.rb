class CreateSurveyResps < ActiveRecord::Migration
  def change
    create_table :survey_resps do |t|
      t.string :question
      t.text :content

      t.timestamps null: false
    end
  end
end
