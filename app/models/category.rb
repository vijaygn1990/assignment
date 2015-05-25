class Category < ActiveRecord::Base
  belongs_to :item
  self.inheritance_column = :_type_disabled
  #attr_accessible :type
end
