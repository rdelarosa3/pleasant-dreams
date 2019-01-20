class Request < ApplicationRecord
  #validations
  validates :first_name, :last_name, :email, :phone_number, :subject, :message, presence: true
end