class AuthorizationsController < ApplicationController
  before_action :set_authorization, only: %i[ show edit update destroy ]

  # GET /authorizations or /authorizations.json
  def index
    @authorizations = Authorization.all
  end

  # GET /authorizations/1 or /authorizations/1.json
  def show
  end

  # GET /authorizations/new
  def new
    @authorization = Authorization.new
  end

  # GET /authorizations/1/edit
  def edit
  end

  # POST /authorizations or /authorizations.json
  def create
    @authorization = Authorization.new(authorization_params)

    respond_to do |format|
      if @authorization.save
        format.html { redirect_to @authorization, notice: "Authorization was successfully created." }
        format.json { render :show, status: :created, location: @authorization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @authorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authorizations/1 or /authorizations/1.json
  def update
    respond_to do |format|
      if @authorization.update(authorization_params)
        format.html { redirect_to @authorization, notice: "Authorization was successfully updated." }
        format.json { render :show, status: :ok, location: @authorization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @authorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authorizations/1 or /authorizations/1.json
  def destroy
    @authorization.destroy!

    respond_to do |format|
      format.html { redirect_to authorizations_path, status: :see_other, notice: "Authorization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorization
      @authorization = Authorization.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def authorization_params
      params.expect(authorization: [ :user_id, :operation_id, :resource_id ])
    end
end
