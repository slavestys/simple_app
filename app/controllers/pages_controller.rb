class PagesController < ApplicationController
	def home
		@title=I18n.t(:t_home)
		 if signed_in?
      			@micropost = Micropost.new
     			 @feed_items = current_user.feed.paginate(:page => params[:page])
   		 end
	end

	def contact
		@title=I18n.t(:t_contact)
	end
	def about
		@title=I18n.t(:t_about)
	end
	def help
		@title = I18n.t(:t_help)
	end
end
