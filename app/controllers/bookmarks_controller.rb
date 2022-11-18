class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[show edit update destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def edit
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new({ comment: bookmark_params['comment'], movie_id: bookmark_params['movie_id'], list_id: @list })
    p @bookmark
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: "You bookmark was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@bookmark.list)
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
