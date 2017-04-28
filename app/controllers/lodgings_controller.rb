class LodgingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lodging, only: [:show, :edit, :update, :destroy]

  def index
    @lodgings = Lodging.search(params[:term])
    # @lodgings = Lodging.all
  end

  def show
    @epostcard_page = @lodging.pages.where(page_type: "e-postcard").first
  end

  def new
    @lodging = Lodging.new
  end

  def edit
  end

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
