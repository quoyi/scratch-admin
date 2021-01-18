# frozen_string_literal: true

<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class Admin::<%= controller_class_name %>Controller < AdminController
  before_action :set_<%= singular_table_name %>, only: %i[show edit update destroy]

  # GET /admin<%= route_url %>
  def index
    @q = <%= singular_table_name.camelize %>.ransack(search_params)
    @q.sorts = ['id desc'] if @q.sorts.empty?
    @<%= plural_table_name %> = @q.result.page(params[:page])
  end

  # GET /admin<%= route_url %>/1
  def show
  end

  # GET /admin<%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  # GET /admin<%= route_url %>/1/edit
  def edit
  end

  # POST /admin<%= route_url %>
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>

    if @<%= orm_instance.save %>
      flash[:notice] = "#{t('activerecord.models.<%= singular_table_name %>')} #{t('admin.actions.created')}"
      redirect_to %i[admin <%= plural_table_name %>]
    else
      render :new
    end
  end

  # PATCH/PUT /admin<%= route_url %>/1
  def update
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      flash[:notice] = "#{t('activerecord.models.<%= singular_table_name %>')} #{t('admin.actions.updated')}"
      redirect_to %i[admin <%= plural_table_name %>]
    else
      render :edit
    end
  end

  # DELETE /admin<%= route_url %>/1
  def destroy
    @<%= orm_instance.destroy %>
    flash[:notice] = "#{t('activerecord.models.<%= singular_table_name %>')} #{t('admin.actions.deleted')}"
    redirect_to %i[admin <%= plural_table_name %>]
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    # Only allow a list of trusted parameters through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params.fetch(:<%= singular_table_name %>, {})
      <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= permitted_params %>)
      <%- end -%>
    end

    def search_params
      params.fetch(:q, {}).permit(:id_eq, :name_cont)
    end
end
<% end -%>
