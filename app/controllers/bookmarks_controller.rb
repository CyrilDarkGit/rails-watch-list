class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[show edit update destroy ]
  before_action :set_list, only: %i[index new create show]

  # GET /bookmarks or /bookmarks.json
  def index
    @bookmarks = Bookmark.all
  end

  # GET /bookmarks/1 or /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # POST /bookmarks or /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = @list.id

    if @bookmark.save
      redirect_to list_bookmarks_path, notice: "Bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # Only allow a bookmark of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
