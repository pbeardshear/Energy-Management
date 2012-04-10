class CategoryTip < ActiveRecord::Base
  belongs_to :category
  belongs_to :tip
end
