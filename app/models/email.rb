class Email < ActiveRecord::Base
  has_many :responses
end
