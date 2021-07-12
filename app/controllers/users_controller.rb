# frozen_string_literal: true

class UsersController < ApplicationController
  layout 'with_header'

  before_action :authenticate_user!, except: %i[show]
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users/:id
  def show
    reviews = @user.reviews
    render 'show', locals: { reviews: reviews }
  end

  # GET /users/:id/edit
  def edit
    if @user&.id == current_user.id
      render 'edit'
    else
      render :file => "public/401.html", :status => :unauthorized
    end
  end

  # PATCH /users/:id
  def update
    if @user&.id == current_user.id
      if params[:new_password]
        if @user.update
          redirect_to @user
        else
          redirect_to edit_user(@user)
        end
      elsif @user.update_without_password(user_params)
        redirect_to @user
      else
        redirect_to edit_user(@user)
      end
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    redirect_to new_user_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :new_password, :new_password_confirmation)
  end

  def set_user
    @user ||= User.find(params[:id])
  end
end