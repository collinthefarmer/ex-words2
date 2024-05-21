defmodule Words.Repo.Migrations.AddMessageFrom do
  use Ecto.Migration

  def change do
    alter table("messages") do
      add :from_id, references(:players, on_delete: :delete_all)
    end
  end
end
