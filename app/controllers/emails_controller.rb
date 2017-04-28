class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy, :deliver]

  layout 'page'

  def show
    @lodging = Lodging.find(@email.lodging_id)
    @epostcard = Epostcard.find(@email.epostcard_id)
    render :layout => "epostcard"
  end

  def deliver
    @lodging = Lodging.find(@email.lodging_id)
    @epostcard = Epostcard.find(@email.epostcard_id)
    EpostcardMailer.epostcard_mail(@email).deliver_now
    redirect_to @email, notice: 'postcard was successfully sent!'
  end

  def new
    @email = Email.new
    @epostcard = Epostcard.find((params[:pid]))
    @lodging = Lodging.find((params[:lid]))
  end

  def create
    @email = Email.new(email_params)

    respond_to do |format|
      if @email.save
        format.html { redirect_to email_path(@email, send_token: @email.send_token), notice: 'postcard was successfully created, click send below to send it!' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @email, notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:from_name, :from_email, :to_name, :to_email, :message, :sent_at, :failed_at, :attempt_count, :epostcard_id, :lodging_id, :opt_in, :send_token )
    end
end
