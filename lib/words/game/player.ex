defmodule Words.Game.Player do
  alias Words.Game.Item
  alias Words.Game.PlayerItem

  alias Words.Lobby.Room
  alias Words.Users.User

  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :turn_position, :integer
    field :score, :integer

    belongs_to :room, Room
    belongs_to :user, User

    many_to_many :items, Item, join_through: PlayerItem

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:turn_position, :score, :room_id, :user_id])
    |> validate_required([:turn_position, :score, :room_id, :user_id])
    |> unique_constraint([:room_id, :user_id])
  end
end
