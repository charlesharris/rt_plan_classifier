class CanonicalPlansController < ApplicationController
  before_action :set_canonical_plan, only: [:show, :edit, :update, :destroy]

  # GET /canonical_plans
  # GET /canonical_plans.json
  def index
    @canonical_plans = CanonicalPlan.order(:id).page(params[:page])
  end

  # GET /canonical_plans/1
  # GET /canonical_plans/1.json
  def show
  end

  # GET /canonical_plans/new
  def new
    @canonical_plan = CanonicalPlan.new
  end

  # GET /canonical_plans/1/edit
  def edit
  end

  # POST /canonical_plans
  # POST /canonical_plans.json
  def create
    @canonical_plan = CanonicalPlan.new(canonical_plan_params)

    respond_to do |format|
      if @canonical_plan.save
        format.html { redirect_to @canonical_plan, notice: 'Canonical plan was successfully created.' }
        format.json { render :show, status: :created, location: @canonical_plan }
      else
        format.html { render :new }
        format.json { render json: @canonical_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /canonical_plans/1
  # PATCH/PUT /canonical_plans/1.json
  def update
    respond_to do |format|
      if @canonical_plan.update(canonical_plan_params)
        format.html { redirect_to @canonical_plan, notice: 'Canonical plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @canonical_plan }
      else
        format.html { render :edit }
        format.json { render json: @canonical_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canonical_plans/1
  # DELETE /canonical_plans/1.json
  def destroy
    @canonical_plan.destroy
    respond_to do |format|
      format.html { redirect_to canonical_plans_url, notice: 'Canonical plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canonical_plan
      @canonical_plan = CanonicalPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canonical_plan_params
      params.require(:canonical_plan).permit(:id, :plan_name)
    end
end
