class CategosController < ApplicationController
  before_action :set_catego, only: %i[ show edit update destroy ]
  before_action :default_category, only: %i[ index new create ]

  def index
    @categos = Catego.all
  end

  def show
  end

  def new
    @catego = Catego.new
  end

  def edit
  end

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

  def destroy
    @catego.destroy!

    respond_to do |format|
      format.html { redirect_to categos_path, status: :see_other, notice: "Catego was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def default_category
      Catego.find_or_create_by(name: 'All')
    end

    def set_catego
      @catego = Catego.find(params[:id])
    end

    def catego_params
      params.require(:catego).permit(:name)
    end
end
