defmodule Task1Web.PageController do
  use Task1Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def login(conn, %{"email" => email}) do
    user = Task1.Users.get_user_email(email)
    if user == nil do
      conn
      |> put_flash(:error, "Error Email not Found: #{email}")
      |> redirect(to: Routes.page_path(conn, :index))
    else
      conn
      |> put_session(:user_id, user.email)
      |> put_flash(:info, "Logged In: #{user.email}")
      |> redirect(to: Routes.task_path(conn, :index))
    end
  end

  def logout(conn, _params) do
    conn
    |> put_session(:user_id, nil)
    |> put_flash(:info, "Logged Out!")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
