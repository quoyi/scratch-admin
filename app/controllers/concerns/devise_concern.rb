# frozen_string_literal: true

module DeviseConcern
  extend ActiveSupport::Concern

  included do
    before_action :store_user_location!, if: :storable_location?
    before_action :devise_params_permit!, if: :devise_controller?
    before_action :authenticate_user!
  end

  protected

    def devise_params_permit!
      attribute_names = %i[email password password_confirmation remember_me]
      devise_parameter_sanitizer.permit(:sign_in, keys: attribute_names)
      devise_parameter_sanitizer.permit(:sign_up, keys: attribute_names)
    end

  private

    def after_sign_in_path_for(_resource_or_scope)
      # current_user&.admin? ? admin_root_path : dashboard_path
      stored_location_for(:user) || root_path
    end

    def after_sign_out_path_for(_resource_or_scope)
      # return admin_root_path if resource_or_scope == :admin
      root_path
    end

    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end
end
