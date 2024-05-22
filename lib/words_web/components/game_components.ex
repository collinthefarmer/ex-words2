defmodule WordsWeb.GameComponents do
  use Phoenix.Component

  alias Words.Game.Player

  attr :player, Player, required: true
  attr :is_their_turn, :boolean, required: true

  def player_card(assigns) do
    ~H"""
    <div class="flex flex-row gap-2 p-1 justify-between bg-white rounded-lg pl-4">
      <p class={"flex " <> case @is_their_turn, do: (true -> "text-blue-500 font-bold"; _ -> "")}><%= @player.user.email%></p>
      <p class="rounded-full bg-black w-1/5 text-center text-white" ><%= @player.score %></p>
    </div>
    """
  end

  attr :players, :list, required: true
  attr :turn, :integer, required: true

  def players(assigns) do
    ~H"""
    <div class="flex flex-col bg-black gap-4 p-4">
      <%= for player <- @players do %>
        <.player_card
          player={player} 
          is_their_turn={@turn == player.turn_position}
        />
      <% end %>
    </div>
    """
  end
 
  attr :message, Words.Room.Message, required: true
  attr :from_current_user, :boolean, required: true

  def message_card(assigns) do
    ~H"""
    <div class={"bg-black text-white" <> case @from_current_user, do: (true -> ""; false -> "")}>
      <p><%= @message.body %></p>
      <p class="text-xs">
        <span><%= @message.from.user.email %></span>,
        <span><%= Calendar.strftime(@message.inserted_at, "%I:%M %p") %></span>
      </p>
    </div>
    """
  end

  attr :player_messages, :list, required: true

  def message_feed(assigns) do
    ~H"""
      <div class="flex flex-col justify-stretch">
        <%= for msg <- @player_messages do %>
          <.message_card message={msg} from_current_user={false} />
        <% end %>
      </div>
    """
  end

  attr :board, Words.Game.Board

  def game_board(assigns) do
    ~H"""
      <div>board</div>
    """
  end

end
