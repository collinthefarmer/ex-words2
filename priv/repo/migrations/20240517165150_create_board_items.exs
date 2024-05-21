defmodule Words.Repo.Migrations.CreateBoardItems do
  use Ecto.Migration

  def change do
    create table(:board_items) do
      add :board_id, references(:boards, on_delete: :delete_all)
      add :player_id, references(:players, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end
  end
end
