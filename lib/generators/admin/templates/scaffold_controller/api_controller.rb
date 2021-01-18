# frozen_string_literal: true

<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class Admin<%= controller_class_name %>Controller < AdminController
  before_action :set_<%= singular_name %>, only: [:show, :update, :destroy]

  # GET <%= route_url %>
  def index
    @<%= plural_name %> = <%= orm_class.all(singular_name.camelize) %>

    render json: <%= "@#{plural_name}" %>
  end

  # GET <%= route_url %>/1
  def show
    render json: <%= "@#{singular_name}" %>
  end

  # POST <%= route_url %>
  def create
    @<%= singular_name %> = <%= orm_class.build(singular_name.camelize, "#{singular_name}_params") %>

    if @<%= orm_instance(singular_name).save %>
      render json: <%= "@#{singular_name}" %>, status: :created, location: <%= "@#{singular_name}" %>
    else
      render json: <%= "@#{orm_instance(singular_name).errors}" %>, status: :unprocessable_entity
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    if @<%= orm_instance(singular_name).update("#{singular_name}_params") %>
      render json: <%= "@#{singular_name}" %>
    else
      render json: <%= "@#{orm_instance(singular_name).errors}" %>, status: :unprocessable_entity
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= orm_instance(singular_name).destroy %>
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_name %>
      @<%= singular_name %> = <%= orm_class.find(singular_name.camelize, "params[:id]") %>
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_name}_params" %>
      <%- if attributes_names.empty? -%>
      params.fetch(:<%= singular_name %>, {})
      <%- else -%>
      params.require(:<%= singular_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
end
<% end -%>
