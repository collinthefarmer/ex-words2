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
      |> assign(
        :new_messages,
        []
      )
    }
  end

  def render(assigns) do
    ~H"""
    <div>
      <WordsWeb.GameComponents.players players={@room.players} turn={@room.turn_position}/>
      <WordsWeb.GameComponents.message_feed player_messages={@room.messages ++ @new_messages} />
      <.message_input/>
      <WordsWeb.GameComponents.game_board board={@room.board} />
      <.inventory />
    </div>
    """
  end

  def message_input(assigns) do
    msg_form = to_form(%{"body" => ""})
    assigns = assigns |> assign(msg_form: msg_form)
    ~H"""
    <.form for={@msg_form} phx-submit="send_message">
      <.input field={@msg_form["body"]} />
      <button>send!</button>
    </.form>
    """
  end
 
  def handle_event("send_message", %{"body" => body}, socket) do
    Words.Room.send_message(
      body,
      socket.assigns.room,
      socket.assigns.current_player
    )

    {:noreply, socket}
  end

  def handle_info(%{:payload => payload, type: :player_message}, socket) do
    {:noreply,
     assign(
       socket,
       :new_messages,
       socket.assigns.new_messages ++ [payload]
     )}
  end

  def inventory(assigns) do
    ~H"""
    <div>inventory!</div>
    """
  end
end
