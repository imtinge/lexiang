class GamesController < ApplicationController
  before_action :require_login, only: :show

  # GET /games
  # GET /games.json
  def index
    if @tag_id=params[:tag_id]
      @tag =  ActsAsTaggableOn::Tag.find(@tag_id)
      @games = Game.tagged_with(@tag.name).paginate(page: params[:page], per_page: 12)
    else
      @games = Game.paginate(page: params[:page], per_page: 12)
    end
    @tags = Game.tag_counts_on(:tags)
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])
  end
end
