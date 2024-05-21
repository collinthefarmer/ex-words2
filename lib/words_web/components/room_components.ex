defmodule WordsWeb.RoomComponents do
  alias Words.Users.User

  use Phoenix.Component

  attr :user, User, required: true

  def user_card(assigns) do
    ~H"""
    <div>
      <span><%= @user.email %></span>
    </div>
    """
  end
end
