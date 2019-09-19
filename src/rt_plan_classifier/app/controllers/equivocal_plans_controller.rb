class EquivocalPlansController < ApplicationController
  before_action :set_equivocal_plan, only: [:show, :edit, :update, :destroy]

  # GET /equivocal_plans
  # GET /equivocal_plans.json
  def index
    @equivocal_plans = EquivocalPlan.order(:id).page(params[:page])
  end

  # GET /equivocal_plans/1
  # GET /equivocal_plans/1.json
  def show
  end

  # GET /equivocal_plans/new
  def new
    @equivocal_plan = EquivocalPlan.new
  end

  # GET /equivocal_plans/1/edit
  def edit
  end

  # POST /equivocal_plans
  # POST /equivocal_plans.json
  def create
    @equivocal_plan = EquivocalPlan.new(equivocal_plan_params)

    respond_to do |format|
      if @equivocal_plan.save
        format.html { redirect_to @equivocal_plan, notice: 'Equivocal plan was successfully created.' }
        format.json { render :show, status: :created, location: @equivocal_plan }
      else
        format.html { render :new }
        format.json { render json: @equivocal_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equivocal_plans/1
  # PATCH/PUT /equivocal_plans/1.json
  def update
    respond_to do |format|
      if @equivocal_plan.update(equivocal_plan_params)
        format.html { redirect_to @equivocal_plan, notice: 'Equivocal plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @equivocal_plan }
      else
        format.html { render :edit }
        format.json { render json: @equivocal_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equivocal_plans/1
  # DELETE /equivocal_plans/1.json
  def destroy
    @equivocal_plan.destroy
    respond_to do |format|
      format.html { redirect_to equivocal_plans_url, notice: 'Equivocal plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equivocal_plan
      @equivocal_plan = EquivocalPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equivocal_plan_params
      params.require(:equivocal_plan).permit(:id, :plan_name, :canonical_plan_id)
    end
end
