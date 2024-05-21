defmodule Words.Room.Room do
  alias Words.Room.Message
  alias Words.Game.Board

  alias Words.Game.Player

  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :turn_position, :integer, default: 0

    has_one :board, Board

    has_many :players, Player
    has_many :messages, Message

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:turn_position])
    |> validate_required([:turn_position])
  end
end
