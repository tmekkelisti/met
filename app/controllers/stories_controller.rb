class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, except: [:index, :show]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all.sort_by(&:created_at).reverse!
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @comments = @story.comments
    @comment = Comment.new
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id
    #strip_tags(@story.story)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'tarina on kerrottu' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'tarina on muokattu' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    if current_user == @story.user
      @story.destroy
    end

    respond_to do |format|
      format.html { redirect_to :back, notice: 'tarina on nyt poistettu' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :story, :user_id)
    end
end
