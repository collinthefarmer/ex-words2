defmodule Words.Repo.Migrations.CreateSlots do
  use Ecto.Migration

  def change do
    create table(:slots) do
      add :position, :integer

      add :board_id, references(:boards, on_delete: :delete_all)
      add :item_id, references(:items, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:slots, [:board_id])
  end
end
