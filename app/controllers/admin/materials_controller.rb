# frozen_string_literal: true

class Admin::MaterialsController < AdminController
  before_action :set_material, only: %i[show edit update destroy]

  # GET /admin/materials
  def index
    @q = Material.ransack(search_params)
    @q.sorts = ['id desc'] if @q.sorts.empty?
    @materials = @q.result.page(params[:page])
  end

  # GET /admin/materials/1
  def show
  end

  # GET /admin/materials/new
  def new
    @material = Material.new
  end

  # GET /admin/materials/1/edit
  def edit
  end

  # POST /admin/materials
  def create
    @material = Material.new(material_params)

    if @material.save
      flash[:notice] = "#{t('activerecord.models.material')} #{t('admin.actions.created')}"
      redirect_to %i[admin materials]
    else
      render :new
    end
  end

  # PATCH/PUT /admin/materials/1
  def update
    if @material.update(material_params)
      flash[:notice] = "#{t('activerecord.models.material')} #{t('admin.actions.updated')}"
      redirect_to %i[admin materials]
    else
      render :edit
    end
  end

  # DELETE /admin/materials/1
  def destroy
    @material.destroy
    flash[:notice] = "#{t('activerecord.models.material')} #{t('admin.actions.deleted')}"
    redirect_to %i[admin materials]
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def material_params
      params.require(:material).permit(:code, :name, :status, :mold, :used, :info, :category_id, :uploader_id)
    end

    def search_params
      params.fetch(:q, {}).permit(:id_eq, :name_cont)
    end
end
