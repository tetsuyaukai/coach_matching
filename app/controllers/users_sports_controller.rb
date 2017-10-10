class UsersSportsController < ApplicationController
  before_action :set_users_sport, only: %i[show edit update destroy]

  # GET /users_sports
  # GET /users_sports.json
  def index
    @users_sports = UsersSport.all
  end

  # GET /users_sports/1
  # GET /users_sports/1.json
  def show; end

  # GET /users_sports/new
  def new
    @users_sport = UsersSport.new
  end

  # GET /users_sports/1/edit
  def edit; end

  # POST /users_sports
  # POST /users_sports.json
  def create
    @users_sport = UsersSport.new(users_sport_params)

    respond_to do |format|
      if @users_sport.save
        format.html { redirect_to @users_sport, notice: 'Users sport was successfully created.' }
        format.json { render :show, status: :created, location: @users_sport }
      else
        format.html { render :new }
        format.json { render json: @users_sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_sports/1
  # PATCH/PUT /users_sports/1.json
  def update
    respond_to do |format|
      if @users_sport.update(users_sport_params)
        format.html { redirect_to @users_sport, notice: 'Users sport was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_sport }
      else
        format.html { render :edit }
        format.json { render json: @users_sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_sports/1
  # DELETE /users_sports/1.json
  def destroy
    @users_sport.destroy
    respond_to do |format|
      format.html { redirect_to users_sports_url, notice: 'Users sport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_users_sport
    @users_sport = UsersSport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def users_sport_params
    params.fetch(:users_sport, {})
  end
end
