defmodule Words.Game.PlayerItem do
  alias Words.Game.Item
  alias Words.Game.Player

  use Ecto.Schema
  import Ecto.Changeset

  schema "player_items" do
    belongs_to :player, Player
    belongs_to :item, Item

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player_item, attrs) do
    player_item
    |> cast(attrs, [])
    |> validate_required([])
  end
end
