defmodule ObanInsertAllUniqueWeb.PageController do
  use ObanInsertAllUniqueWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
