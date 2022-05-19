class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

    # GET /lists or /lists.json
    def index
      @lists = List.all
    end

    # GET /lists/1 or /lists/1.json
    def show
      @bookmarks = @list.bookmarks
      @bookmark = Bookmark.new
    end

    # GET /lists/new
    def new
      @list = List.new
    end

    # POST /lists or /lists.json
    def create
      @list = List.new(list_params)
      if @list.save
        redirect_to lists_path, notice: "List was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name)
    end

end
