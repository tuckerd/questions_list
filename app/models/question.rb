class Question < ActiveRecord::Base
  attr_accessible :domain, :priority, :question

  validates :question, presence: true
  validates :priority, inclusion:{in: %w(Low Medium High), message:'Priority must be Low, Medium, or High'} 
end
