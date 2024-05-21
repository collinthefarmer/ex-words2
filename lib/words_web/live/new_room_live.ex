defmodule WordsWeb.NewRoomLive do
  use WordsWeb, :live_view

  def mount(params, session, socket) do
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
        <div phx-value-user_id={user.id} phx-click="toggle_user">
          invite?: <WordsWeb.RoomComponents.user_card user={user} />
        </div>
      <% end %>
    </div>
    <button phx-click="launch_room">Start Game</button>
    """
  end

  def handle_event("toggle_user", %{"user_id" => user_id}, socket) do
    {:noreply,
     assign(
       socket,
       :selected_users,
       cond do
         user_id in socket.assigns.selected_users ->
           socket.assigns.selected_users
           |> Enum.reject(&(&1 == user_id))

         true ->
           socket.assigns.selected_users ++ [user_id]
       end
     )}
  end

  def handle_event("launch_room", _params, socket) do
    players = [
      socket.assigns.current_user
      | socket.assigns.invite_options
        |> Enum.filter(fn u -> u.id in socket.assigns.selected_users end)
    ]

    with {:ok, room} <- Words.Room.create_room(players) do
      # ... push notifications to all users selected         
      {:noreply, push_navigate(socket, to: ~p"/rooms/#{room.id}")}
    else
      _ -> {:noreply, socket}
    end
  end
end
