# frozen_string_literal: true

# The application main landing page after sign in.
class HomeController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index; end
end
