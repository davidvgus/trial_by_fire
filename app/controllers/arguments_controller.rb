class ArgumentsController < ApplicationController
  before_action :set_argument, only: [:show, :edit, :update, :destroy, :submit_to_judgement, :add_judges]

  # GET /arguments
  # GET /arguments.json
  def index
    @arguments = current_user.arguments
    @con_side_arguments = Argument.where(con_side_id: current_user.id)
  end

  # GET /arguments/1
  # GET /arguments/1.json
  def show
    authorize @argument
    @users_elegible_to_be_judges = @argument.eligible_judges
  end

  # GET /arguments/new
  def new
    @essay = Essay.find(params[:essay_id])
    @argument = Argument.new
    authorize @argument
  end

  # GET /arguments/1/edit
  def edit
    authorize @argument
  end

  # POST /arguments
  # POST /arguments.json
  def create
    @argument = Argument.new
    @argument.owner = current_user
    @argument.con_side = User.find(params[:argument][:con_side_id])
    @argument.essay = Essay.find(params[:essay_id])
    authorize @argument

    respond_to do |format|
      if @argument.save
        format.html { redirect_to @argument, notice: 'Argument was successfully created.' }
        format.json { render :show, status: :created, location: @argument }
      else
        format.html { render :new }
        format.json { render json: @argument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arguments/1
  # PATCH/PUT /arguments/1.json
  def update
    authorize @argument
    respond_to do |format|
      if @argument.update(argument_params)
        format.html { redirect_to @argument, notice: 'Argument was successfully updated.' }
        format.json { render :show, status: :ok, location: @argument }
      else
        format.html { render :edit }
        format.json { render json: @argument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arguments/1
  # DELETE /arguments/1.json
  def destroy
    authorize @argument
    @argument.destroy
    respond_to do |format|
      format.html { redirect_to arguments_url, notice: 'Argument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def submit_to_judgement
    authorize @argument
    @argument.selecting_judges!
    redirect_to action: 'show'
  end

  def add_judges

    @argument.judges.destroy_all
    params["judge_users"].each do |judge_id|
      @argument.judges << User.find(judge_id) unless [ @argument.owner.id, @argument.con_side.id].include?(judge_id)
    end

    added_judges = " These judges were added: "
    flash[:notice] = "#{added_judges}#{@argument.judges.pluck(:user_name).join(", ")}"

    redirect_to action: :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_argument
      @argument = Argument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def argument_params
      params.require(:argument).permit(:owner_id, :con_side_id, :con_side_essay)
    end
end
