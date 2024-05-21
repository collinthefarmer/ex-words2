defmodule Words.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :body, :string

      add :room_id, references(:rooms, on_delete: :delete_all)
      add :player_id, references(:players, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:messages, [:room_id])
  end
end
