class Response < ActiveRecord::Base
  belongs_to :email, dependent: :destroy
end
