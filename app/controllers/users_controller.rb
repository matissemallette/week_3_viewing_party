class UsersController <ApplicationController 
    def new 
        @user = User.new()
    end 

    def show 
        @user = User.find(params[:id])
    end 

    def create
        user = User.create(user_params)

        if user_params[:password].nil? || user_params[:password].empty? 
            flash[:error] = 'Password cannot be blank'
            redirect_to register_path
        elsif user_params[:password_confirmation].nil? || user_params[:password_confirmation].empty?
            flash[:error] = 'Password confirmation cannot be blank'
            redirect_to register_path
        elsif user.save
            redirect_to user_path(user)
        else  
            flash[:error] = user.errors.full_messages.to_sentence
            redirect_to register_path
        end 
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end 
end 