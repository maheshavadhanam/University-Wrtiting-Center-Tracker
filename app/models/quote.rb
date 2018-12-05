class Quote < ApplicationRecord
  def self.get
    Quote.order('RANDOM()').first
  end
end
