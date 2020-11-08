defmodule SparklineWeb.InputController do
  use SparklineWeb, :controller

  def index(conn, _params) do
    render(conn, "input.html", [changeset: nil, action: ""])
  end

end
