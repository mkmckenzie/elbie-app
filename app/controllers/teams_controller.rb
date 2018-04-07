class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :detach_teammate]
  before_action :get_teammates, only: [:show]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = current_user.teams.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    if params[:keep_teammate_ids]
      removed_teammate = @team.teammates.map(&:id) - params[:keep_teammate_ids].map(&:to_i)
      removed_teammate.each do |teammate_id|
        @team.teammates.delete(Teammate.find(teammate_id))
      end
    end

    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def detach_teammate
    if params[:remove_teammate_ids]
      params[:remove_teammate_ids].each do |teammate_id|
        @team.teammates.delete(Teammate.find(teammate_id))
      end
      redirect_to team_path(@team), notice: 'Teammate was removed from team.'
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def get_teammates
      @teammates = @team.teammates
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :description, :public, :shareable, :keep_teammate_ids, :remove_teammate_ids)
    end
end
