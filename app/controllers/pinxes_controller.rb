class PinxesController < ApplicationController
  before_action :set_pinx, only: [:show, :edit, :update, :destroy]

  def index
    @pinxes = Pinx.all
  end


  def show
  end

 
  def new
    @pinx = Pinx.new
  end


  def edit
  end


  def create
    @pinx = Pinx.new(pinx_params)

   respond_to do |format|
      if @pinx.save
        redirect_to @pinx, notice: 'Pinx was successfully created.' 
       
      else
      render action: 'new'
      end
   end
  end

 
  def update
    respond_to do |format|
      if @pinx.update(pinx_params)
        format.html { redirect_to @pinx, notice: 'Pinx was successfully updated.' }
        format.json { render :show, status: :ok, location: @pinx }
      else
        format.html { render :edit }
        format.json { render json: @pinx.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @pinx.destroy
    respond_to do |format|
      format.html { redirect_to pinxes_url, notice: 'Pinx was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pinx
      @pinx = Pinx.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pinx_params
      params.require(:pinx).permit(:description)
    end
end
