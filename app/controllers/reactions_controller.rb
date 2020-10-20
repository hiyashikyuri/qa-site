class ReactionsController < ApplicationController
  before_action :set_reaction, only: [:show, :edit, :update, :destroy]

  # GET /reactions
  # GET /reactions.json
  def index
    @reactions = Reaction.all
  end

  # GET /reactions/1
  # GET /reactions/1.json
  def show
  end

  # GET /reactions/new
  def new
    answer = Answer.find(params[:answer_id])
    @reaction = answer.reactions.build(user_id: current_user.id)
  end

  # GET /reactions/1/edit
  def edit
  end

  # POST /reactions
  # POST /reactions.json
  def create
    answer = Answer.find(params[:answer_id])
    @reaction = answer.reactions.build(reaction_params)

    respond_to do |format|
      if @reaction.save
        format.html { redirect_to @reaction, notice: 'Reaction was successfully created.' }
        format.json { render :show, status: :created, location: @reaction }
      else
        format.html { render :new }
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reactions/1
  # PATCH/PUT /reactions/1.json
  def update
    respond_to do |format|
      if @reaction.update(reaction_params)
        format.html { redirect_to @reaction, notice: 'Reaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @reaction }
      else
        format.html { render :edit }
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reactions/1
  # DELETE /reactions/1.json
  def destroy
    @reaction.destroy
    respond_to do |format|
      format.html { redirect_to reactions_url, notice: 'Reaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reaction
      @reaction = Reaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reaction_params
      params.require(:reaction).permit(:user_id, :answer_id, :body)
    end
end
