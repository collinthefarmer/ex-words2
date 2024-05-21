defmodule Words.Game.BoardItem do
  alias Words.Game.Board
  alias Words.Game.Item

  use Ecto.Schema
  import Ecto.Changeset

  schema "board_items" do
    belongs_to :board, Board
    belongs_to :item, Item

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(board_item, attrs) do
    board_item
    |> cast(attrs, [:glyph, :value])
    |> validate_required([:glyph, :value])
  end
end
