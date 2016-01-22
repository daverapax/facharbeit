class CommentsController < ApplicationController
  #before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @book = Book.find(params[:book_id])
    @comments = @book.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show

    @user = User.find(1)
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])

    if params[:like] == 'like'
      like
      redirect_to author_book_comment_path(@book.author.id, @book.id, @comment.id, :like => nil)
    end

  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit

    @book = Book.find(params[:book_id])
    #raise params.to_yaml
    @comment = @book.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @book = Book.find(params[:book_id])
    #raise params.to_yaml
    @comment = @book.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to author_book_comments_path, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def like
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
    @like = @comment.like
    @like = @like + 1
    @comment.update(like: @like)

  end

  def dislike

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :book_id, :user_id, :like, :dislike)
    end
end
