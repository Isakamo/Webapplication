class Response < ApplicationRecord
  belongs_to :thre
  belongs_to :user
  belongs_to :response
  belongs_to :up_file
end
