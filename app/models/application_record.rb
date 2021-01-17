# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :todays, -> { where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day) }

  def self.strftime(format = :serial)
    Time.current.to_s(format)
  end

  # def self.rails_blob_path(attachment, only_path: true)
  #   Rails.application.routes.url_helpers.rails_blob_path(attachment, only_path: only_path)
  # end
end
