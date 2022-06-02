# frozen_string_literal: true

class AboutController < ApplicationController
def index
  session[:about_counter] ||= 0
  session[:about_counter] += 1
  I18n.locale = session.fetch(:locale, I18n.default_locale).to_sym
  end
end
