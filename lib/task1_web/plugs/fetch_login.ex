defmodule Task1Web.Plugs.FetchLogin do
  import Plug.Conn

  def init(args), do: args

  def call(conn, _args) do
    email = get_session(conn, :user_id)
    if email == nil do
      assign(conn, :current_user, nil)
    else
      user = Task1.Users.get_user_email(email)
      assign(conn, :current_user, user)
    end
  end
end
