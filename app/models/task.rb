class Task < ApplicationRecord
	belongs_to :user
	has_many :timers , :dependent=> :destroy, :autosave => true
	validates :current_value, numericality: {greater_than_or_equal_to: 0}
	validates :target_value, presence: true, numericality: {greater_than: 0}
	validates :target_date, numericality: {greater_than_or_equal_to: Time.now.to_i, message: "must be after today"}
end
