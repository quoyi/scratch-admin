# frozen_string_literal: true

module Admin
  class HelperGenerator < Rails::Generators::NamedBase # :nodoc:
    source_root File.expand_path('../templates/helper', __dir__)

    check_class_collision suffix: "Helper"

    def create_helper_files
      template "helper.rb", File.join("app/helpers/admin", class_path, "#{file_name}_helper.rb")
    end

    hook_for :test_framework

    private
      def file_name
        @_file_name ||= super.sub(/_helper\z/i, "")
      end
  end
end
