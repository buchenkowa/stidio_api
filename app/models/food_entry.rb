class FoodEntry < ApplicationRecord
  belongs_to :client, class_name: "User"
end
