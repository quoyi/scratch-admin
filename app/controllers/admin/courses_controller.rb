# frozen_string_literal: true

class Admin::CoursesController < AdminController
  before_action :set_course, only: %i[show edit update destroy]

  # GET /admin/courses
  def index
    @q = Course.includes(:creator).ransack(search_params)
    @q.sorts = ['id desc'] if @q.sorts.empty?
    @courses = @q.result.page(params[:page])
  end

  # GET /admin/courses/1
  def show
  end

  # GET /admin/courses/new
  def new
    @course = Course.new
  end

  # GET /admin/courses/1/edit
  def edit
  end

  # POST /admin/courses
  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "#{t('activerecord.models.course')} #{t('admin.actions.created')}"
      redirect_to %i[admin courses]
    else
      render :new
    end
  end

  # PATCH/PUT /admin/courses/1
  def update
    if @course.update(course_params)
      flash[:notice] = "#{t('activerecord.models.course')} #{t('admin.actions.updated')}"
      redirect_to %i[admin courses]
    else
      render :edit
    end
  end

  # DELETE /admin/courses/1
  def destroy
    @course.destroy
    flash[:notice] = "#{t('activerecord.models.course')} #{t('admin.actions.deleted')}"
    redirect_to %i[admin courses]
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:code, :name, :status, :mold, :seq, :children_count,
                                     :intro, :desc, :parent_id, :creator_id)
    end

    def search_params
      params.fetch(:q, {}).permit(:id_eq, :name_cont)
    end
end
