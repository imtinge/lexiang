class Admin::GamesController < ApplicationController
  before_action :require_login
  before_action :require_admin
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def not_authenticated
    redirect_to login_path, alert: '访问本页面前请先登录！'
  end


  # GET /games
  # GET /games.json
  def index
    @games = Game.paginate(page: params[:page], per_page: 15)
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to admin_game_path(@game), notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    if @game.update(game_params)
      redirect_to admin_game_path(@game), notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    redirect_to admin_games_url, notice: 'Game was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:title, :content, :picture, :tag_list)
    end

    def require_admin
      unless current_user.admin?
        flash.now[:alert] = '需要拥有管理员权限才能访问本业！'
        redirect_to root_path
      end
    end
end
