class Admin::MembersController < ApplicationController
  def new
    @member = Member.new
  end
  
  def create
   @member = Member.new(member_params)
   if @member.save
    redirect_to admin_members_path, notice: "メンバー「#{@member.name}」を登録しました。"
   else
    render :new
   end
  end

  def edit
    @member =Member.find(params[:id])
  end

  def show
    @member = Member.find(params[:id])
  end

  def index
    @members = Member.all
  end
  
  def update
    @member = Member.find(params[:id])
    
    if @member.update(member_params)
      redirect_to admin_member_path(@member), notice: "メンバー「#{@member.name}」を更新しました。"
    else
     render :new
    end
  end
  
  def destroy
  @member = Member.find(params[:id])
  @member.destroy
  redirect_to admin_members_url, notice: "メンバー「#{@member.name}」を削除しました。"
  end
  
  private
  def member_params
    params.require(:member).permit(:name, :email, :admin, :password)
  end
end
