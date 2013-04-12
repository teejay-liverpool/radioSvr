module ApplicationHelper
	def full_title( page_title )
		baseTitle = 'Big Button Radio'
		if page_title.empty?
			baseTitle
		else
			"#{baseTitle} | #{page_title}"
		end
	end
end	
