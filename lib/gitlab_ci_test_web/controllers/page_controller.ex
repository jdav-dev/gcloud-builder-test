defmodule GitlabCiTestWeb.PageController do
  use GitlabCiTestWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
