class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  def search
    @posts = Post.search(params[:search])
  end

  def new_posts
    @posts = Post.order("created_at desc")
  end

  def old_posts
    @posts = Post.order("created_at asc")
  end

  def empathy_posts
    @posts = Post.order_by_empathy
  end

  def cheer_posts
    @posts = Post.order_by_cheer
  end

  def tag_posts
    @posts = Post.joins(:tags).where(tags: {title: params[:tag]})
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @empathy = Empathy.new
  end

  # GET /posts/new
  def new
    @post = Post.new
    @tags = Tag.all
  end

  # GET /posts/1/edit
  def edit
    @tags = Tag.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html {
          # PostTag.create(post_id: @post.id, tag_id: params[:post][:tags][:tag_id])
          redirect_to @post, notice: 'Post was successfully created.'
        }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content, tag_ids: [])
    end
end
