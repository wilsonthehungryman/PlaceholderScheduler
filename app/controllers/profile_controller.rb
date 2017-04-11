#
class ProfileController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def view
    @user = User.find(params[:id])
  end

  def list
    params[:page] ||= 1
    @users = User.where(official_association:
                        OfficialAssociation.find(params[:id]))
                 .page(params[:page]).per(20)
  end

  def update
    @user = User.find(params[:id])
    @user.save!
    redirect_to "/profile/view/#{params[:id]}"
  end
end
