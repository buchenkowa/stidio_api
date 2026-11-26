class ProgressEntry < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :author, class_name: "User"
end
