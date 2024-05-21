defmodule Words.Game.Slot do
  alias Words.Game.Board

  use Ecto.Schema
  import Ecto.Changeset

  schema "slots" do
    field :position, :integer

    belongs_to :board, Board

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(slot, attrs) do
    slot
    |> cast(attrs, [:position])
    |> validate_required([:position])
  end
end
