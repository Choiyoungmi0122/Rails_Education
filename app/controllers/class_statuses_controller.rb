class ClassStatusesController < ApplicationController
  before_action :set_class_status, only: [:show, :edit, :update, :destroy]

  # GET /class_statuses
  # GET /class_statuses.json
  def index
    @class_statuses = ClassStatus.all
  end

  # GET /class_statuses/1
  # GET /class_statuses/1.json
  def show
  end

  # GET /class_statuses/new
  def new
    @class_status = ClassStatus.new
  end

  # GET /class_statuses/1/edit
  def edit
  end

  # POST /class_statuses
  # POST /class_statuses.json
  def create
    @class_status = ClassStatus.new(class_status_params)

    # user_id와 class_list_id를 직접 가져옴
    user_id = @class_status.user_id
    class_id = @class_status.class_list_id

    # user 변수를 초기화
    user = User.find(user_id)  
    class_list = ClassList.find(class_id)

    current_credits = user.current_credits  # User 객체를 통해 메서드 호출
    new_credits = class_list.credits || 0  # credits가 nil일 경우 기본값 0

    respond_to do |format|
      # 중복 신청 여부 확인
      if ClassStatus.applied?(user.id, class_list.id)
        format.html { redirect_to root_path, notice: '중복신청은 되지 않습니다.' }
      # 수강 인원 초과 여부 확인
      elsif ClassStatus.exceeds_capacity?(class_list.id)
        format.html { redirect_to root_path, notice: '수강 인원을 초과할 수 없습니다.' }
      # 최대 학점 수 확인
      elsif !user.can_add_credits?(new_credits)  # 메서드를 호출하여 학점 초과 확인
        format.html { redirect_to class_lists_path, notice: '한 사람당 최대 학점 수를 초과할 수 없습니다.' }
      else 
        @class_status.save
        format.html { redirect_to class_lists_path, notice: '강의 신청이 완료되었습니다.' }
      end
    end
  end

  # PATCH/PUT /class_statuses/1
  # PATCH/PUT /class_statuses/1.json
  def update
    respond_to do |format|
      if @class_status.update(class_status_params)
        format.html { redirect_to @class_status, notice: '강의 신청이 완료되었습니다.' }
        format.json { render :show, status: :ok, location: @class_status }
      else
        format.html { render :edit }
        format.json { render json: @class_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_statuses/1
  # DELETE /class_statuses/1.json
  def destroy
    @class_status.destroy
    respond_to do |format|
      format.html { redirect_to class_lists_path, notice: '강의신청이 취소되었습니다.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_class_status
    @class_status = ClassStatus.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def class_status_params
    params.require(:class_status).permit(:user_id, :class_list_id)
  end
end
