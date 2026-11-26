class ProgressEntry < ApplicationRecord
  belongs_to :client
  belongs_to :author
end
