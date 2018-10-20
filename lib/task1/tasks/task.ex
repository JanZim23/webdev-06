defmodule Task1.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :created, :integer
    field :desc, :string
    field :done, :boolean, default: false
    field :name, :string
    field :owner_id, :id
    field :time, :integer

    #belongs_to :owner, User

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :desc, :done, :created, :time, :owner_id])
    |> validate_required([:name, :desc, :done, :created, :time, :owner_id])
  end
end
