class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_user_basic_info]
  before_action :logged_in_user, only: [:index, :basic_info, :update_basic_info, :edit, :update, :destroy, :edit_basic_info, :update_user_basic_info]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :basic_info, :update_basic_info, :destroy, :edit_basic_info, :update_user_basic_info]
  before_action :set_one_month, only: :show


  def index
    @users = User.search_by_name(params[:search]).paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end


  def basic_info
  end


  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
    respond_to do |format|
     format.html
     format.json { render json: @user }
    end
  end


  def new
    @user = User.new
   
    respond_to do |format|
     format.html
     format.json { render json: @user }
    end
  end



  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        log_in @user
        flash[:success] = '新規作成に成功しました。'
        format.html { redirect_to @user }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
  end


  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = "ユーザー情報を更新しました。"
        format.html { redirect_to @user }
        format.json { render json: @user, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
  
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  def update_basic_info
    work_time = parse_time_param(params[:work_time])
    basic_time = parse_time_param(params[:basic_time])

    if work_time.nil? || basic_time.nil?
      flash[:danger] = "指定勤務時間・基本勤務時間を正しい形式（例: 09:00）で入力してください。"
    else
      User.update_all(work_time: work_time, basic_time: basic_time)
      flash[:success] = "全ユーザーの基本情報を更新しました。"
    end
    redirect_to basic_info_users_path
  end


  def edit_basic_info
  end


  def update_user_basic_info
    work_time = parse_time_param(params[:work_time])
    basic_time = parse_time_param(params[:basic_time])

    if work_time.nil? || basic_time.nil?
      flash[:danger] = "指定勤務時間・基本勤務時間を正しい形式（例: 09:00）で入力してください。"
    else
      @user.update(work_time: work_time, basic_time: basic_time)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    end
    redirect_to edit_basic_info_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
  end

  def parse_time_param(value)
    Time.zone.parse(value) if value.present?
  rescue ArgumentError
    nil
  end
end