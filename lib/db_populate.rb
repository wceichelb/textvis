require 'byebug'
require 'CSV'

Email.where(nil).delete_all

exlude_list = ["n/a", "na", "#name", "{question_not_shown}", "br", "no", "no.", "none"]

lol = CSV.read("db/results-survey795667.csv")
key = lol.shift
emails = []

lol.uniq{ |row| row[-1] }.each do |row|
  Email.create!(email: row[-1])
end

lol.each_with_index do |row|
  email = row.pop()
  row.each_with_index do |entry, index|
    unless entry.to_s.strip.length == 0
      if !exlude_list.include?(entry.downcase)
        Response.create!(email: Email.where(email: email).first, content: entry, resp_type: key[index].to_s.delete(' '))
      end
    end
  end
end
