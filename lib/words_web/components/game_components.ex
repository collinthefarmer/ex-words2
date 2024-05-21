defmodule WordsWeb.GameComponents do
  use Phoenix.Component

  alias Words.Game.Player

  attr :player, Player, required: true

  def player_card(assigns) do
    ~H"""
    <div>
      <p><%= @player.score %></p>
    </div>
    """
  end

  attr :players, :list, required: true

  def players(assigns) do
    ~H"""
    <div>
      <%= for player <- @players do %>
        <.player_card player={player} />
      <% end %>
    </div>
    """
  end
end
