class Presription < ApplicationRecord
	belongs_to :user

	has_many :drugs, dependent: :destroy
 	accepts_nested_attributes_for :drugs, :allow_destroy => true, :reject_if => proc { |attributes| attributes.all? { |key, value| key == '_destroy' || value.blank? } }
	
end
