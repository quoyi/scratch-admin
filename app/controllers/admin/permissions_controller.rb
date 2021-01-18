# frozen_string_literal: true

class Admin::PermissionsController < AdminController
  before_action :set_permission, only: %i[show edit update destroy]

  # GET /admin/permissions
  def index
    @q = Permission.ransack(search_params)
    @q.sorts = ['id desc'] if @q.sorts.empty?
    @permissions = @q.result.page(params[:page])
  end

  # GET /admin/permissions/1
  def show
  end

  # GET /admin/permissions/new
  def new
    @permission = Permission.new
  end

  # GET /admin/permissions/1/edit
  def edit
  end

  # POST /admin/permissions
  def create
    @permission = Permission.new(permission_params)

    if @permission.save
      flash[:notice] = "#{t('activerecord.models.permission')} #{t('admin.actions.created')}"
      redirect_to %i[admin permissions]
    else
      render :new
    end
  end

  # PATCH/PUT /admin/permissions/1
  def update
    if @permission.update(permission_params)
      flash[:notice] = "#{t('activerecord.models.permission')} #{t('admin.actions.updated')}"
      redirect_to %i[admin permissions]
    else
      render :edit
    end
  end

  # DELETE /admin/permissions/1
  def destroy
    @permission.destroy
    flash[:notice] = "#{t('activerecord.models.permission')} #{t('admin.actions.deleted')}"
    redirect_to %i[admin permissions]
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def permission_params
      params.require(:permission).permit(:code, :name, :status, :intro, :desc, :namespace, :controller, :action)
    end

    def search_params
      params.fetch(:q, {}).permit(:id_eq, :name_cont)
    end
end
