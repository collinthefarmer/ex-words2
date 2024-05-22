defmodule WordsWeb.NewRoomLive do
  use WordsWeb, :live_view

  def mount(_params, _session, socket) do
    invite_options = Words.Users.list_friends(socket.assigns.current_user)

    {
      :ok,
      socket
      |> assign(:invite_options, invite_options)
      |> assign(:selected_users, [])
    }
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= for user <- @invite_options do %>
        <div>
          <WordsWeb.RoomComponents.user_card user={user} />
          <button phx-value-user_id={user.id} phx-click="toggle_user">invite</button>
        </div>
      <% end %>
    </div>
    <button phx-click="launch_room">Start Game</button>
    """
  end

  def handle_event("toggle_user", %{"user_id" => user_id}, socket) do
    {
      :noreply,
      assign(
        socket,
        :selected_users,
        toggle_user_in_selected(user_id, socket.assigns)
      )
    }
  end

  def handle_event("launch_room", _, socket) do
    case launch_room(parse_players(socket.assigns)) do
      {:ok, room} -> {:noreply, push_navigate(socket, to: ~p"/rooms/#{room.id}")}
      _ -> {:noreply, socket}
    end
  end

  def parse_players(assigns) do
    (assigns.selected_users
     |> Enum.map(fn user_id -> Words.Users.get_user!(user_id) end)) ++
      [assigns.current_user]
  end

  def toggle_user_in_selected(user_id, assigns) do
    cond do
      user_id in assigns.selected_users ->
        assigns.selected_users
        |> Enum.reject(&(&1 == user_id))

      true ->
        assigns.selected_users ++ [user_id]
    end
  end

  def launch_room(players) do
    Words.Room.create_room(players)
  end
end
