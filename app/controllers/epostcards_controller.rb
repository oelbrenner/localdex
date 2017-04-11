class EpostcardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_epostcard, only: [:show, :edit, :update, :destroy]
  layout 'epostcard'

  def index
    @epostcards = Epostcard.all
  end

  def show
    # make some sample data for the previews
    @lodging = Lodging.first
    @email = Email.first
  end

  def new
    @epostcard = Epostcard.new
  end

  def edit
  end

  def create
    @epostcard = Epostcard.new(epostcard_params)

    respond_to do |format|
      if @epostcard.save
        format.html { redirect_to page_path(params[:epostcard][:page_id]), notice: 'Epostcard was successfully created.' }
        format.json { render :show, status: :created, location: @epostcard }
      else
        format.html { render :new }
        format.json { render json: @epostcard.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @epostcard.update(epostcard_params)
        format.html { redirect_to @epostcard, notice: 'Epostcard was successfully updated.' }
        format.json { render :show, status: :ok, location: @epostcard }
      else
        format.html { render :edit }
        format.json { render json: @epostcard.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @epostcard.destroy
    respond_to do |format|
      format.html { redirect_to epostcards_url, notice: 'Epostcard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_epostcard
      @epostcard = Epostcard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def epostcard_params
      params.require(:epostcard).permit(:name, :main_image, :page_id)
    end
end
