defmodule Words.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :turn_position, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
