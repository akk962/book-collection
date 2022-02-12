class UserbooksController < ApplicationController
  before_action :set_userbook, only: %i[ show edit update destroy ]

  # GET /userbooks or /userbooks.json
  def index
    @userbooks = Userbook.all
    @users = User.all
    @books = Book.all
  end

  # GET /userbooks/1 or /userbooks/1.json
  def show
    @book = Book.find(@userbook.book_id)
    @user = User.find(@userbook.user_id)
  end

  # GET /userbooks/new
  def new
    @userbook = Userbook.new
    @books = Book.all
    @users = User.all
  end

  # GET /userbooks/1/edit
  def edit
    @books = Book.all
    @users = User.all
  end

  # POST /userbooks or /userbooks.json
  def create
    @userbook = Userbook.new(userbook_params)

    respond_to do |format|
      if @userbook.save
        format.html { redirect_to userbook_url(@userbook), notice: "Userbook was successfully created." }
        format.json { render :show, status: :created, location: @userbook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @userbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userbooks/1 or /userbooks/1.json
  def update
    respond_to do |format|
      if @userbook.update(userbook_params)
        format.html { redirect_to userbook_url(@userbook), notice: "Userbook was successfully updated." }
        format.json { render :show, status: :ok, location: @userbook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @userbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userbooks/1 or /userbooks/1.json
  def destroy
    @userbook.destroy

    respond_to do |format|
      format.html { redirect_to userbooks_url, notice: "Userbook was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userbook
      @userbook = Userbook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def userbook_params
      params.require(:userbook).permit(:user_id, :book_id)
    end
end
