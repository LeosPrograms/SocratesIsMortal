class SyllogismsController < ApplicationController
  before_action :set_syllogism, only: [:show, :edit, :update, :destroy]

  # GET /syllogisms
  # GET /syllogisms.json
  def index
    @syllogisms = Syllogism.all.order('created_at DESC').limit(40)
  end

  # GET /syllogisms/1
  # GET /syllogisms/1.json
  def show
  end

  # GET /syllogisms/new
  def new
    @syllogism = Syllogism.new
  end

  # GET /syllogisms/1/edit
  def edit
    unless params[:password]=="supersecret1234"
      redirect_to syllogisms_path and return
    end
  end

  # POST /syllogisms
  # POST /syllogisms.json
  def create
    @syllogism = Syllogism.new(syllogism_params)

    respond_to do |format|
      if @syllogism.save
        format.html { redirect_to @syllogism, notice: 'Syllogism was successfully created.' }
        format.json { render :show, status: :created, location: @syllogism }
      else
        format.html { render :new }
        format.json { render json: @syllogism.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /syllogisms/1
  # PATCH/PUT /syllogisms/1.json
  def update
    respond_to do |format|
      if @syllogism.update(syllogism_params)
        format.html { redirect_to @syllogism, notice: 'Syllogism was successfully updated.' }
        format.json { render :show, status: :ok, location: @syllogism }
      else
        format.html { render :edit }
        format.json { render json: @syllogism.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syllogisms/1
  # DELETE /syllogisms/1.json
  def destroy
    @syllogism.destroy
    respond_to do |format|
      format.html { redirect_to syllogisms_url, notice: 'Syllogism was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_syllogism
      @syllogism = Syllogism.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def syllogism_params
      params.require(:syllogism).permit(:title, :author, :known, :premises, :conclusion)
    end
end
