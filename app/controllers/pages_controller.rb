class PagesController < ApplicationController
  def index
    @selected_players = Player.none
    @players = Player.all
  end

  def add_player
    @selected_players =  selected_players + [Player.find(params["pid"])]
    @players = Player.all - @selected_players
  end

  def remove_player
    @selected_players =  selected_players - [Player.find(params["pid"])]
    @players = Player.all - @selected_players
  end

  private

  def selected_players
    params["sid"].split(' ').compact.map { |id| Player.find(id.to_i)}
  end
end
