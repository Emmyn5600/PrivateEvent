class CreatesController < ApplicationController
  before_action :set_create, only: %i[ show edit update destroy ]

  # GET /creates or /creates.json
  def index
    @creates = Create.all
  end

  # GET /creates/1 or /creates/1.json
  def show
  end

  # GET /creates/new
  def new
    @create = Create.new
  end

  # GET /creates/1/edit
  def edit
  end

  # POST /creates or /creates.json
  def create
    @create = Create.new(create_params)

    respond_to do |format|
      if @create.save
        format.html { redirect_to @create, notice: "Create was successfully created." }
        format.json { render :show, status: :created, location: @create }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @create.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creates/1 or /creates/1.json
  def update
    respond_to do |format|
      if @create.update(create_params)
        format.html { redirect_to @create, notice: "Create was successfully updated." }
        format.json { render :show, status: :ok, location: @create }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @create.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creates/1 or /creates/1.json
  def destroy
    @create.destroy
    respond_to do |format|
      format.html { redirect_to creates_url, notice: "Create was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create
      @create = Create.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def create_params
      params.require(:create).permit(:Event, :title, :description, :location)
    end
end
