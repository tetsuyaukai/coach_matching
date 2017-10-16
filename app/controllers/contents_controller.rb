class ContentsController < ApplicationController
  load_and_authorize_resource

  # GET /contents
  # GET /contents.json
  def index
    @contents = @contents.where('scheduled_date = ?', params[:date]) if params[:date]
    @contents = @contents.all

    @current_user = current_user

    @contents = @contents.page(params[:page])

    # for console
    p current_user
  end

  # coach index
  def coach_index
    @contents = @contents.where('scheduled_date = ?', params[:date]) if params[:date]
    @contents = @contents.all

    @agreements = current_user.agreements

    @contents = @contents.page(params[:page])

    # for console
    p current_user

  end

  # GET /contents/1
  # GET /contents/1.json
  def show

    p "---------"
    p @contents

  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit; end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)
    @content.user_id = current_user.id
    p "--------------"
    p @content.errors
    p content_params

    respond_to do |format|
      if @content.save
        format.html { redirect_to coach_contents_url, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to coach_contents_url, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_content
    @content = Content.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def content_params
    params.fetch(:content, {}).permit(
    :place_id, :scheduled_date, :scheduled_time, :menu
    )
  end
end
