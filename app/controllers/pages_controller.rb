class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  layout 'page'


  def show
    @epostcards = @page.epostcards.where.not(id:  nil)
    @lodging = @page.lodging
  end

  def edit
    @new_epostcard = Epostcard.new
  end

  def new
    @lodging = Lodging.find(params[:lodging_id])
    @page = Page.new(content_header: 'Send a e-postcard!', content_one: "#{@lodging.company_name} is happy to bring you these custom e-postcards", content_two: 'Select one below, and send a note back home', page_type: "e-postcard", active: true, lodging_id: @lodging.id)
    @new_epostcard = Epostcard.new

    respond_to do |format|
      if @page.save
        format.html { redirect_to edit_page_path(@page), notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:content_header, :content_one, :content_two, :page_type, :active, :lodging_id)
      params.require(:page).permit(:content_header, :content_one, :content_two, :page_type, :active, :lodging_id, epostcards_attributes: [:id, :name, :main_image,  :_destroy])
    end
end
