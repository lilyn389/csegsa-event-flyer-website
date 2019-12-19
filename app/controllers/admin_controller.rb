class AdminsController < ApplicationController
    before_action :require_login, only: [:home]

end