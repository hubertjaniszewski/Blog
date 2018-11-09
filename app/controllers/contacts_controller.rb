class ContactsController < ApplicationController
    load_and_authorize_resource class: "Message", param_method: :message_params


    def new
        @message = @contact
    end

    def index
        @messages = @contacts
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
        @message = @contact
        @message.destroy
        if @message.destroy
            flash[:success] = "Message was successfully deleted"
        redirect_to contacts_path
        else
            flash[:danger] = "Message was successfully deleted"
        end
    end

    private

    def message_params
        params.require(:message).permit(:email, :title, :description)        
    end

end