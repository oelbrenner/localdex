class LodgingsController < ApplicationController
  before_action :set_lodging, only: [:show, :edit, :update, :destroy]

  # GET /lodgings
  # GET /lodgings.json
  def index
    @lodgings = Lodging.all
  end

  # GET /lodgings/1
  # GET /lodgings/1.json
  def show
  end

  # GET /lodgings/new
  def new
    @lodging = Lodging.new
  end

  # GET /lodgings/1/edit
  def edit
  end

  # POST /lodgings
  # POST /lodgings.json
  def create
    @lodging = Lodging.new(lodging_params)

    respond_to do |format|
      if @lodging.save
        format.html { redirect_to @lodging, notice: 'Lodging was successfully created.' }
        format.json { render :show, status: :created, location: @lodging }
      else
        format.html { render :new }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lodgings/1
  # PATCH/PUT /lodgings/1.json
  def update
    respond_to do |format|
      if @lodging.update(lodging_params)
        format.html { redirect_to @lodging, notice: 'Lodging was successfully updated.' }
        format.json { render :show, status: :ok, location: @lodging }
      else
        format.html { render :edit }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lodgings/1
  # DELETE /lodgings/1.json
  def destroy
    @lodging.destroy
    respond_to do |format|
      format.html { redirect_to lodgings_url, notice: 'Lodging was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lodging
      @lodging = Lodging.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lodging_params
      params.require(:lodging).permit(:destination_ref, :region_ref, :company_name, :address_line_one, :address_line_two, :city, :state, :zip, :phone, :reservation, :fax, :url, :contact, :season, :email, :details, :mask2id_ref, :expires_at, :paid_at, :customer_status_notes, :user_id)
    end
end
