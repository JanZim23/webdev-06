defmodule Task1.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :desc, :string
      add :done, :boolean, default: false, null: false
      add :created, :integer
      add :time, :integer
      add :owner_id, :integer

      timestamps()
    end

  end
end
