class Product < ActiveRecord::Base
	validates :name, :price, :description, :presence => true
	validates :name, :uniqueness => true
	validates :price, :numericality => {:greater_than => 0}

	belongs_to :category
	has_and_belongs_to_many :tags

	def tags_string 
		self.tags.map(&:name).join(", ")
	end

	def tags_string= (string)
		self.tags = string.split(',').map do |tag|
	      unless tag.blank?
	        Tag.find_or_create_by_name(tag.strip)
	      end
	    end.compact
	end
end
