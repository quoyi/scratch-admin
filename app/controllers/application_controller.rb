# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :warning, :error

  include DeviseConcern
end
