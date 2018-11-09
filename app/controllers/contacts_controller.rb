class ContactsController < ApplicationController
    load_and_authorize_resource class: "Message", param_method: :message_params


    def new
        @message = Message.new
    end

    def index
        @message = Message.all
    end

    def create
        @message = Message.new(message_params)
        if @message.save
            flash[:success] = "Message was successfully sent"
            redirect_to welcome_page_path
            UserMailer.welcome_email(@message).deliver_now
        else
            render 'new'
        end 
    end

    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        flash[:success] = "Message was successfully deleted"
        redirect_to contacts_path
    end

    private

    def message_params
        params.require(:message).permit(:email, :title, :description)        
    end

end