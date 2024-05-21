defmodule Words.Game.Board do
  alias Words.Lobby.Room
  alias Words.Game.Item
  alias Words.Game.BoardItem
  alias Words.Game.Slot

  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :width, :integer
    field :height, :integer

    has_many :slots, Slot

    many_to_many :items, Item, join_through: BoardItem

    belongs_to :room, Room

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:width, :height])
    |> validate_required([:width, :height])
  end
end
