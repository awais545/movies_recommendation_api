class Api::V1::UsersController < ApplicationController
  respond_to :json
  
  # POST /api/v1/users
  def create
    params_data = parse_json_request
    return render json: { :errors => I18n::t('invalid_format') }, status: 400 unless params_data
    
    @user = User.new params_data
    
    if @user.save
      render json: @user, status: 201 #creation response
    else
      render json: @user.errors, status: 404 #error
    end
  end

  # PUT /api/v1/users/:id
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      render json: @user, status: 200
    else
      render json: @user.errors, status: 422 #unprocessable_entity
    end
  end

  # DELETE /api/v1/users/:id
  def destroy
    @user = User.find_by_id(params[:id])
    return render json: { :errors => I18n::t('user_not_found') }, status: 404 unless @user
    
    @user.destroy
    render json: @user, status: 204 #no_content
  end
end
