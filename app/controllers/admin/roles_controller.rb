# frozen_string_literal: true

class Admin::RolesController < AdminController
  before_action :set_role, only: %i[show edit update destroy]

  # GET /admin/roles
  def index
    @q = Role.includes(:organization).ransack(search_params)
    @q.sorts = ['id desc'] if @q.sorts.empty?
    @roles = @q.result.page(params[:page])
  end

  # GET /admin/roles/1
  def show
  end

  # GET /admin/roles/new
  def new
    @role = Role.new
  end

  # GET /admin/roles/1/edit
  def edit
  end

  # POST /admin/roles
  def create
    @role = Role.new(role_params)

    if @role.save
      flash[:notice] = "#{t('activerecord.models.role')} #{t('admin.actions.created')}"
      redirect_to %i[admin roles]
    else
      render :new
    end
  end

  # PATCH/PUT /admin/roles/1
  def update
    if @role.update(role_params)
      flash[:notice] = "#{t('activerecord.models.role')} #{t('admin.actions.updated')}"
      redirect_to %i[admin roles]
    else
      render :edit
    end
  end

  # DELETE /admin/roles/1
  def destroy
    @role.destroy
    flash[:notice] = "#{t('activerecord.models.role')} #{t('admin.actions.deleted')}"
    redirect_to %i[admin roles]
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def role_params
      params.require(:role).permit(:code, :name, :status, :intro, :desc, :organization_id)
    end

    def search_params
      params.fetch(:q, {}).permit(:id_eq, :name_cont)
    end
end
