# frozen_string_literal: true

class Admin::CategoriesController < AdminController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /admin/categories
  def index
    @q = Category.ransack(search_params)
    @q.sorts = ['id desc'] if @q.sorts.empty?
    @categories = @q.result.page(params[:page])
  end

  # GET /admin/categories/1
  def show
  end

  # GET /admin/categories/new
  def new
    @category = Category.new
  end

  # GET /admin/categories/1/edit
  def edit
  end

  # POST /admin/categories
  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "#{t('activerecord.models.category')} #{t('admin.actions.created')}"
      redirect_to %i[admin categories]
    else
      render :new
    end
  end

  # PATCH/PUT /admin/categories/1
  def update
    if @category.update(category_params)
      flash[:notice] = "#{t('activerecord.models.category')} #{t('admin.actions.updated')}"
      redirect_to %i[admin categories]
    else
      render :edit
    end
  end

  # DELETE /admin/categories/1
  def destroy
    @category.destroy
    flash[:notice] = "#{t('activerecord.models.category')} #{t('admin.actions.deleted')}"
    redirect_to %i[admin categories]
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:code, :name, :status, :desc, :superior_id,
                                       :classifiable_id, :classifiable_type)
    end

    def search_params
      params.fetch(:q, {}).permit(:id_eq, :name_cont)
    end
end
