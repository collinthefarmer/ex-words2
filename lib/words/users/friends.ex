defmodule Words.Users.Friend do
  use Ecto.Schema

  schema "friends" do
    field :id1, :id
    field :id2, :id
  end
end
