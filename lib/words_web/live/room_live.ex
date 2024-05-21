defmodule WordsWeb.RoomLive do
  use WordsWeb, :live_view

  def mount(%{"room_id" => room_id}, _session, socket) do
    room = Words.Room.get_room!(room_id)
    Words.Room.subscribe_room_event(room)

    {
      :ok,
      socket
      |> assign(:room, room)
      |> assign(
        :current_player,
        room.players
        |> Enum.find(fn p -> p.user_id == socket.assigns.current_user.id end)
      )
      |> assign(:players, room.players)
      |> assign(:player_messages, room.messages)
    }
  end

  def render(assigns) do
    ~H"""
    <div>
      <WordsWeb.GameComponents.players players={@players} />
      <.messages player_messages={@player_messages} />
      <.board />
      <.inventory />
    </div>
    """
  end

  attr :player_messages, :list, required: true

  def messages(assigns) do
    msg_form = to_form(%{"body" => ""})
    assigns = assigns |> assign(msg_form: msg_form)

    ~H"""
    <div>
      <div>
        <%= for msg <- @player_messages do %>
          <p><%= msg.body %></p>
        <% end %>
      </div>
      <.form for={@msg_form} phx-submit="send_message">
        <.input field={@msg_form["body"]} />
        <button>send!</button>
      </.form>
    </div>
    """
  end

  def handle_event("send_message", %{"body" => body}, socket) do
    Words.Room.send_message(
      body,
      socket.assigns.room,
      socket.assigns.player
    )

    {:noreply, socket}
  end

  def handle_info(%{:payload => payload, type: :player_message}, socket) do
    {:noreply,
     assign(
       socket,
       :player_messages,
       socket.assigns.player_messages ++ [payload]
     )}
  end

  def board(assigns) do
    ~H"""
    <div>board!</div>
    """
  end

  def inventory(assigns) do
    ~H"""
    <div>inventory!</div>
    """
  end
end
