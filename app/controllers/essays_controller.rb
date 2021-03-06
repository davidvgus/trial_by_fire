class EssaysController < ApplicationController
  before_action :set_essay, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /essays
  # GET /essays.json
  def index
    #@essays = @user.essays
    @essays = policy_scope(Essay)
    authorize @essays
  end

  # GET /essays/1
  # GET /essays/1.json
  def show
    authorize @essay
  end

  # GET /essays/new
  def new
    @essay = Essay.new
    authorize @essay
  end

  # GET /essays/1/edit
  def edit
    authorize @essay
  end

  # POST /essays
  # POST /essays.json
  def create
    @essay = Essay.new(essay_params)
    @essay.user = @user
    authorize @essay

    respond_to do |format|
      if @essay.save
        format.html { redirect_to [@user, @essay], notice: 'Essay was successfully created.' }
        format.json { render :show, status: :created, location: @essay }
      else
        format.html { render :new }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /essays/1
  # PATCH/PUT /essays/1.json
  def update
    authorize @essay
    respond_to do |format|
      if @essay.update(essay_params)
        format.html { redirect_to [@user, @essay], notice: 'Essay was successfully updated.' }
        format.json { render :show, status: :ok, location: @essay }
      else
        format.html { render :edit }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /essays/1
  # DELETE /essays/1.json
  def destroy
    authorize @essay
    @essay.destroy
    respond_to do |format|
      format.html { redirect_to user_essays_url, notice: 'Essay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_essay
      @essay = Essay.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def essay_params
      params.require(:essay).permit(:title, :description, :body)
    end
end
