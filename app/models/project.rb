class Project < ApplicationRecord
	has_many :notes
	validates :nome, presence: true
	validates :cliente, presence: true
end
