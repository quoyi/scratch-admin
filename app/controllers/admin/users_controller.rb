# frozen_string_literal: true

class Admin::UsersController < AdminController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /admin/users
  def index
    @q = User.ransack(search_params)
    @q.sorts = ['id desc'] if @q.sorts.empty?
    @users = @q.result.page(params[:page])
  end

  # GET /admin/users/1
  def show
  end

  # GET /admin/users/new
  def new
    @user = User.new
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "#{t('activerecord.models.user')} #{t('admin.actions.created')}"
      redirect_to %i[admin users]
    else
      render :new
    end
  end

  # PATCH/PUT /admin/users/1
  def update
    if @user.update(user_params)
      flash[:notice] = "#{t('activerecord.models.user')} #{t('admin.actions.updated')}"
      redirect_to %i[admin users]
    else
      render :edit
    end
  end

  # DELETE /admin/users/1
  def destroy
    @user.destroy
    flash[:notice] = "#{t('activerecord.models.user')} #{t('admin.actions.deleted')}"
    redirect_to %i[admin users]
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:mobile, :email, :password, :nick, :gender,
                                     :token, :status, :role, :guest)
    end

    def search_params
      params.fetch(:q, {}).permit(:id_eq, :email_cont)
    end
end
