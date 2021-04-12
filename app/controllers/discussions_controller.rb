class DiscussionsController < ApplicationController
  def index
    @discussions = Discussion.all
  end
  
  def show
    @discussion = Discussion.find(params[:id])
  end
  
  def new
    @discussion = Discussion.new
  end
  
  def create
    discussion = Discussion.new(discussion_params)
    discussion.save!
    redirect_to discussions_url, notice: "ディスカッションテーマ「#{discussion.theme}」を登録しました。"
  end
  
  def edit
    @discussion = Discussion.find(params[:id])
  end
  
  def update 
    discussion = Discussion.find(params[:id])
    discussion.update!(discussion_params)
    redirect_to discussions_url, notice: "ディスカッションテーマ「#{discussion.theme}」を更新しました。"
  end
  def destroy
    discussion = Discussion.find(params[:id])
    discussion.destroy
    redirect_to discussions_url, notice: "ディスカッションテーマ「#{discussion.theme}」を削除しました。"
  end
private
  def discussion_params
    params.require(:discussion).permit(:theme, :discription)
  end
end