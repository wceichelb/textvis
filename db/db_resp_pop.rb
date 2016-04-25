require 'byebug'
require 'CSV'

SurveyResp.where(question:"comments").delete_all

lol = CSV.read("db/comments.csv")

lol.each do |row|
  SurveyResp.create!(question:"comments", content: row.first)
end
