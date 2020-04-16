class UsersController < ApplicationController

    skip_before_action(:check_login, only: [:view_login, :handle_login,:new,:create])

def view_login
    render(:login)
end

def handle_login
    user = User.find_by({ user_name: params[:user_name]})
    if (user!=nil && user.authenticate(params[:password]))
        session[:user_id] = user.id
        redirect_to('/trivia')
    else
        p "Login Failed"
    end
end
    
    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        @user.save
        redirect_to('/trivia')
    end

    def index
        @users= User.all
       end
    
    def show
         @user= User.find(params[:id])
    end


    def edit
        @user =User.find(params[:id])
    end

    def update
        @user= User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end
   
    private
    def user_params
        params.require(:user).permit(:name,:email_address,:password,:user_name)
    end
end