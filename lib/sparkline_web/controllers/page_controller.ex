defmodule SparklineWeb.PageController do
  use SparklineWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
  
end
