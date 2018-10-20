defmodule Task1.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :admin, :boolean, default: false
    field :email, :string
    field :username, :string

    #has_many :tasks, Task
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :admin, :email])
    |> validate_required([:username, :email])
  end
end
