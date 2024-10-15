class CategosController < ApplicationController
  before_action :set_catego, only: %i[ show edit update destroy ]

  # GET /categos or /categos.json
  def index
    @categos = Catego.all
  end

  # GET /categos/1 or /categos/1.json
  def show
  end

  # GET /categos/new
  def new
    @catego = Catego.new
  end

  # GET /categos/1/edit
  def edit
  end

  # POST /categos or /categos.json
  def create
    @catego = Catego.new(catego_params)

    respond_to do |format|
      if @catego.save
        format.html { redirect_to @catego, notice: "Catego was successfully created." }
        format.json { render :show, status: :created, location: @catego }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @catego.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categos/1 or /categos/1.json
  def update
    respond_to do |format|
      if @catego.update(catego_params)
        format.html { redirect_to @catego, notice: "Catego was successfully updated." }
        format.json { render :show, status: :ok, location: @catego }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @catego.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categos/1 or /categos/1.json
  def destroy
    @catego.destroy!

    respond_to do |format|
      format.html { redirect_to categos_path, status: :see_other, notice: "Catego was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catego
      @catego = Catego.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def catego_params
      params.require(:catego).permit(:name)
    end
end
