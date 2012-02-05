WillPaginate::ViewHelpers.pagination_options[:prev_label] = I18n.t(:t_prev)
WillPaginate::ViewHelpers.pagination_options[:next_label] = I18n.t(:t_next)
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :set_locale
  def set_locale
  	I18n.locale=params[:locale] || I18n.default_locale
  end	
	def default_url_options(options={})
		logger.debug "default_url_options is passed options: #{options.inspect}\n"
		{ :locale => I18n.locale }
	end
end
