class Author < ActiveRecord::Base
	has_many :books



	def name
		name = self.vorname.titlecase + " " + self.nachname.titlecase
	end
end
