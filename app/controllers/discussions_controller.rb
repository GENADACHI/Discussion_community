class DiscussionsController < ApplicationController
  def index
    @discussions = current_member.discussions
  end
  
  def show
    @discussion = current_member.discussions.find(params[:id])
  end
  
  def new
    @discussion = Discussion.new
  end
  
  def create
    @discussion = current_member.discussions.new(discussion_params) 
    @discussion.save
    redirect_to @discussion, notice: "ディスカッションテーマ「#{@discussion.theme}」を登録しました。"
  end
  
  def edit
    @discussion = current_member.discussions.find(params[:id])
  end
  
  def update 
    discussion = current_member.discussions.find(params[:id])
    discussion.update!(discussion_params)
    redirect_to discussions_url, notice: "ディスカッションテーマ「#{discussion.theme}」を更新しました。"
  end
  
  def destroy
    discussion = current_member.discussions.find(params[:id])
    discussion.destroy
    redirect_to discussions_url, notice: "ディスカッションテーマ「#{discussion.theme}」を削除しました。"
  end
  
private
  def discussion_params
    params.require(:discussion).permit(:theme, :discription)
  end
end