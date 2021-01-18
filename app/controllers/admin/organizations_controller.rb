# frozen_string_literal: true

class Admin::OrganizationsController < AdminController
  before_action :set_organization, only: %i[show edit update destroy]

  # GET /admin/organizations
  def index
    @q = Organization.includes(:superior).ransack(search_params)
    @q.sorts = ['id desc'] if @q.sorts.empty?
    @organizations = @q.result.page(params[:page])
  end

  # GET /admin/organizations/1
  def show
  end

  # GET /admin/organizations/new
  def new
    @organization = Organization.new
  end

  # GET /admin/organizations/1/edit
  def edit
  end

  # POST /admin/organizations
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      flash[:notice] = "#{t('activerecord.models.organization')} #{t('admin.actions.created')}"
      redirect_to %i[admin organizations]
    else
      render :new
    end
  end

  # PATCH/PUT /admin/organizations/1
  def update
    if @organization.update(organization_params)
      flash[:notice] = "#{t('activerecord.models.organization')} #{t('admin.actions.updated')}"
      redirect_to %i[admin organizations]
    else
      render :edit
    end
  end

  # DELETE /admin/organizations/1
  def destroy
    @organization.destroy
    flash[:notice] = "#{t('activerecord.models.organization')} #{t('admin.actions.deleted')}"
    redirect_to %i[admin organizations]
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.require(:organization).permit(:code, :name, :status, :desc, :intro, :contacts, :mobile, :superior_id)
    end

    def search_params
      params.fetch(:q, {}).permit(:id_eq, :name_cont)
    end
end
