#
class ProfileController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def view
    @user = User.find(params[:id])
  end

  def list
    @users = User.where(official_association:
                        OfficialAssociation.find(params[:id]))
  end
end
