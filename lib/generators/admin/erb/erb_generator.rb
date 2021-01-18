# frozen_string_literal: true

require 'rails/generators/resource_helpers'

module Admin # :nodoc:
  class ErbGenerator < Rails::Generators::NamedBase # :nodoc:
    include Rails::Generators::ResourceHelpers

    source_root File.expand_path('../templates/erb/scaffold', __dir__)

    argument :attributes, type: :array, default: [], banner: "field:type field:type"

    def create_root_folder
      empty_directory File.join("app/views/admin", controller_file_path)
    end

    def copy_view_files
      available_views.each do |view|
        formats.each do |format|
          filename = filename_with_extensions(view, format)
          template filename, File.join("app/views/admin", controller_file_path, filename)
        end
      end
    end

  private
    def available_views
      %w(index edit show new _form _search)
    end

    def formats
      [format]
    end

    def format
      :html
    end

    def handler
      :erb
    end

    def filename_with_extensions(name, file_format = format)
      [name, file_format, handler].compact.join(".")
    end
  end
end
