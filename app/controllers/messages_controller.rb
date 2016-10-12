class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
  	@messages = Message.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end
  def show
  	@message = Message.find(params[:id])
  end
  def edit
  	
  end
  def update
  	if @message.update(message_params)
  		redirect_to message_path
  	else
  		render 'edit'
  	end
  	
  end
  def destroy
  	@message.destroy
  	redirect_to root_path
  end
  def new
  	@message = current_user.messages.build
  end
  def create
  	@message = current_user.messages.build(message_params)

  	if @message.save
  	   redirect_to root_path, notice: "Message was sucessfully created!"
  	else
  		render 'new'
  	end
    
  end
  private
  	def message_params
  	  	params.require(:message).permit(:title, :description)
  	end
  	def find_message
  		@message = Message.find(params[:id])
  		
  	end
end
