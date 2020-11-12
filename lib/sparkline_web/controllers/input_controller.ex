defmodule SparklineWeb.InputController do
  use SparklineWeb, :controller

  def index(conn, _params) do
    render(conn, "input.html", [changeset: :changeset, action: ""])
  end

  def post(conn, %{"changeset" => changeset}) do
    %{"in_file" => in_file} = changeset
    path = Path.expand(in_file.path)
    render(conn, "input_veiw.html", [changeset: :changeset, action: "", file_path: path])
  end

end
