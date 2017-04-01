class ListMeal < ApplicationRecord
  belongs_to :meal
  belongs_to :list
end
