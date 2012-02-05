module ApplicationHelper
	def logo
		logo = image_tag("logo.png", :alt => "Parum", :class => "round")
	end
	def title
		base_title = I18n.t(:t_title)
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
end
