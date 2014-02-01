class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.all
  end

  # GET /chats/1
  # GET /chats/1.json
  def show
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  # POST /chats.json
  def create
    message = params[:message]
    uid = params[:uid]
    user = User.where(:uid=>uid).first

    unless user
      logger.info("============not founddddddddddddddd #{user.id}")
      return
    end
     logger.info("!!!!!!!!!!!!#{user.id}!!!!!!!!!!!!!!!!")
    room = Room.where(:user1_id=>user.id).last 
    logger.info(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ") 
    unless room

      logger.info("============rooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooom #{user.id}")
      room = Room.where(:user2_id=>user.id).last  
      unless room
        logger.info("44444444444444444444444444444")
        return
      end 
    end
    logger.info("22222222222222222222222222222222222222222222222222222") 
  
    @chat=Chat.create(room_id:  room.id, user_id:  user.id, message:  message)

    respond_to do |format|
      
      format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
      format.json { render action: 'show', status: :created, location: @chat }
      
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:room_id, :user_id, :message)
    end
end
