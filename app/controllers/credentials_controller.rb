class CredentialsController < ApplicationController
  before_action :set_credential, only: %i[ show edit update destroy show_password hide_password fetch_password]
  before_action :check_user_role, only: %i[create update destroy]

  # GET /credentials or /credentials.json
  def index
    @credentials = Credential.all
  end

  # GET /credentials/1 or /credentials/1.json
  def show
  end

  def show_password
    render turbo_stream: turbo_stream.update("#{helpers.dom_id(@credential)}_password", partial: "show_password", locals: { credential: @credential })
  end

  def hide_password
    render turbo_stream: turbo_stream.update("#{helpers.dom_id(@credential)}_password", partial: "hide_password", locals: { credential: @credential })
  end

  def fetch_password
    render json: { password: @credential.login_password }
  end

  # GET /credentials/new
  def new
    @credential = Credential.new
    # format.turbo_stream
  end

  # GET /credentials/1/edit
  def edit
  end

  # POST /credentials or /credentials.json
  def create
    params = credential_params.merge({ created_by: current_user.id, updated_by: current_user.id })
    @credential = Credential.new(params)

    respond_to do |format|
      if @credential.save
        format.turbo_stream
        # format.html { redirect_to credential_url(@credential), notice: "Credential was successfully created." }
        # format.json { render :show, status: :created, location: @credential }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credentials/1 or /credentials/1.json
  def update
    params = credential_params.merge(updated_by: current_user.id)
    respond_to do |format|
      if @credential.update(params)
        format.turbo_stream
        # format.html { redirect_to credential_url(@credential), notice: "Credential was successfully updated." }
        # format.json { render :show, status: :ok, location: @credential }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credentials/1 or /credentials/1.json
  def destroy
    @credential.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@credential)}") }
      # format.html { redirect_to credentials_url, notice: "Credential was successfully destroyed." }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credential
      @credential = Credential.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def credential_params
      params.require(:credential).permit(:name, :login_id, :login_password)
    end
  
  def check_user_role
    unless current_user.role == 1
      @error = 'Cant able to perform this opertion'
      redirect_to credentials_path, notice: @error
    end
  end
end
