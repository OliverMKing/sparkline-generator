defmodule SparklineWeb.InputController do
  use SparklineWeb, :controller

  def index(conn, _params) do
    render(conn, "input.html", [changeset: :changeset, action: ""])
  end

  def post(conn, %{"changeset" => changeset}) do
    %{"in_file" => in_file} = changeset
    IO.puts("Content type: " <> in_file.content_type)
    type = in_file.content_type
    render(conn, "input_veiw.html", [changeset: :changeset, action: "", content_type: type])
  end

end
