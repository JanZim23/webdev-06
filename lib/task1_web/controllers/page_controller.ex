defmodule Task1Web.PageController do
  use Task1Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
