# frozen_string_literal: true

module Admin
  class ControllerGenerator < Rails::Generators::NamedBase # :nodoc:
    source_root File.expand_path('../templates/controller', __dir__)

    argument :actions, type: :array, default: [], banner: "action action"
    class_option :skip_routes, type: :boolean, desc: "Don't add routes to config/routes.rb."

    check_class_collision suffix: "Controller"

    def create_controller_files
      template "controller.rb", File.join("app/controllers/admin", class_path, "#{file_name}_controller.rb")
    end

    def add_routes
      return if options[:skip_routes] || actions.empty?

      routing_code = actions.map { |action| "get '#{file_name}/#{action}'" }.join("\n")
      route routing_code, namespace: regular_class_path.push('admin')
    end

    hook_for :template_engine, :test_framework do |generator|
      invoke generator, [ remove_possible_suffix(name), actions ]
    end

    private
      def file_name
        @_file_name ||= remove_possible_suffix(super)
      end

      def remove_possible_suffix(name)
        name.sub(/_?controller$/i, "")
      end
  end
end
