class AgreementsController < ApplicationController

  load_and_authorize_resource

  # GET /agreements
  # GET /agreements.json
  def index
    # @agreements = current_user.agreements

      @agreements = @agreements.page(params[:page])
      p "---------"
      p @agreements
  end

  # GET /agreements/1
  # GET /agreements/1.json
  def show
    # @agreement = Agreement.find(params[:id])
    p "---------"
    p @agreement
  end

  # GET /agreements/new
  def new
    @agreement = Agreement.new
  end

  # GET /agreements/1/edit
  def edit
  end

  # POST /agreements
  # POST /agreements.json
  def create
    p agreement_params
    @agreement = Agreement.new(agreement_params)
    @agreement.user_id = current_user.id
    respond_to do |format|
      if @agreement.save
        format.html { redirect_to agreements_url, notice: 'Agreement was successfully created.' }
        format.json { render :show, status: :created, location: @agreement }
      else
        format.html { render :new }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agreements/1
  # PATCH/PUT /agreements/1.json
  def update
    respond_to do |format|
      if @agreement.update(agreement_params)
        format.html { redirect_to coach_content_url(@agreement.content), notice: 'Agreement was successfully updated.' }
        format.json { render :show, status: :ok, location: @agreement }
      else
        format.html { render :edit }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreements/1
  # DELETE /agreements/1.json
  def destroy
    @agreement.destroy
    respond_to do |format|
      format.html { redirect_to agreements_url, notice: 'Agreement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def agreement_params
      params.fetch(:agreement, {}).permit(
      :content_id, :status
      )
    end
end
