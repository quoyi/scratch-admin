# frozen_string_literal: true

module Admin
  class ResourceRouteGenerator < Rails::Generators::NamedBase # :nodoc:
    # Properly nests namespaces passed into a generator
    #
    #   $ bin/rails generate admin:resource products
    #
    # should give you
    #
    #   namespace :admin do
    #     resources :products
    #   end
    def add_resource_route
      return if options[:actions].present?
      route "resources :#{file_name.pluralize}", namespace: regular_class_path.push('admin')
    end
  end
end
