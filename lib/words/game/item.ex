defmodule Words.Game.Item do
  alias Words.Game.Player
  alias Words.Game.Board
  alias Words.Game.BoardItem
  alias Words.Game.PlayerItem

  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :value, :integer
    field :glyph, :string

    many_to_many :boards, Board, join_through: BoardItem
    many_to_many :players, Player, join_through: PlayerItem

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:glyph, :value])
    |> validate_required([:glyph, :value])
  end
end
