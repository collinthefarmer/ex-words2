defmodule Words.Room.Message do
  alias Words.Room.Room
  alias Words.Game.Player

  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string

    belongs_to :room, Room
    belongs_to :from, Player

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:body, :room_id, :from_id])
    |> validate_required([:body, :room_id, :from_id])
  end
end
