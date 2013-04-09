module ApplicationHelper
	def full_title( page_title )
		baseTitle = 'This is the base title'
		if page_title.empty?
			baseTitle
		else
			"#{baseTitle} | #{page_title}"
		end
	end
end	
