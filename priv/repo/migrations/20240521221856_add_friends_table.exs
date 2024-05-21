defmodule Words.Repo.Migrations.AddFriendsTable do
  use Ecto.Migration

  def change do
    create table("friends") do
      add :id1, references(:users, on_delete: :delete_all)
      add :id2, references(:users, on_delete: :delete_all)
    end
  end
end
