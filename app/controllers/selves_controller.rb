class SelvesController < ApplicationController

  authorize_resource :user

  def show
    @user = current_user

  end

  def edit
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to edit_self_url, notice: 'User_data was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to self_url, notice: 'User_data was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.fetch(:user, {}).permit(
    :name, :birthday, :email, :profile, :gender
    )
  end

end
