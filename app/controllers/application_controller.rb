class ApplicationController < ActionController::Base
  # check for authentication before any action
  before_action :authenticate_user!
end
