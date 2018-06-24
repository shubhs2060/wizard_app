class AfterSignupController < ApplicationController
	include Wicked::Wizard
  steps :confirm_personal, :confirm_social, :finalize

  def show
    @user = current_user
    render_wizard
  end



  def update
    @user = current_user
    #sign_in(@user, bypass: true) # needed for devise
        @user.update_attributes(user_params)

    render_wizard @user
  end



private
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:city,:state,:place)
    end
end
