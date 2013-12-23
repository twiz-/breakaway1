class MarketingController < ApplicationController
  skip_before_filter :authenticate_user!
  def splash
  end
end