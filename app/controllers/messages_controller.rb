class MessagesController < ApplicationController
  def index
    @message = Message.new #Messageモデルのインスタンス情報を代入
    @room = Room.find(params[:room_id]) #パラメータ内に含まれているroom_idも取得する。
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params) #チャットルームに紐付いたメッセージのインスタンスを生成する。
    if @message.save #saveメソッドでメッセージの内容をmessagesテーブルに保存する。
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private
#ストロングパラメーター
#メッセージの内容（content）をmessagesテーブルへ保存する
#パラメーターの中にログインユーザーのidと紐づいているcontentを受け取れるよう許可する。
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id) 
  end

end
