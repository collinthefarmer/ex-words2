defmodule WordsWeb.UserFriendsLive do
  use WordsWeb, :live_view

  def mount(params, session, socket) do
    {
      :ok,
      socket
      |> assign(:friends, Words.Users.list_friends(socket.assigns.current_user))
      |> assign(:search_results, [])
    }
  end

  def render(assigns) do
    ~H"""
    <div>
      <.user_search search_results={@search_results} />
      <.friends_list friends={@friends} />
    </div>
    """
  end

  def user_search(assigns) do
    assigns =
      assigns
      |> assign(:user_search, to_form(%{"email" => ""}))

    ~H"""
    <.form for={@user_search}>
      <.input field={@user_search["email"]} phx-change="search_users" phx-debounce={300} />
    </.form>
    <ul>
      <%= for user <- @search_results do %>
        <li>
          <span><%= user.email %></span><button phx-click="add_friend" phx-value-user_id={user.id}>add</button>
        </li>
      <% end %>
    </ul>
    """
  end

  def friends_list(assigns) do
    ~H"""
    <%= for user <- @friends do %>
      <div>
        <WordsWeb.RoomComponents.user_card user={user} />
        <button phx-click="remove_friend" phx-value-user_id={user.id}>remove as friend</button>
      </div>
    <% end %>
    """
  end

  def handle_event("add_friend", %{"user_id" => user_id}, socket) do
    Words.Users.add_friend(socket.assigns.current_user, Words.Users.get_user!(user_id))
    {:noreply, socket}
  end

  def handle_event("remove_friend", %{"user_id" => user_id}, socket) do
    Words.Users.remove_friend(socket.assigns.current_user, Words.Users.get_user!(user_id))
    {:noreply, socket}
  end

  def handle_event("search_users", %{"email" => email}, socket) do
    # validate the email input here

    {:noreply,
     socket
     |> assign(
       :search_results,
       Words.Users.search_users_by_partial_email(email)
     )}
  end
end
