defmodule SparklineWeb.InputController do
  use SparklineWeb, :controller

  def index(conn, _params) do
    render(conn, "input.html", [changeset: :changeset, action: ""])
  end

  def post(conn, %{"changeset" => changeset}) do
    %{"in_file" => in_file} = changeset
    path = Path.expand(in_file.path)

    # Reads file and stores as string
    text = elem(File.read(path), 1)
    nums = Enum.map(String.split(text, ", ", trim: true), fn x -> elem(Integer.parse(x), 0) end)
    IO.inspect nums
    render(conn, "input_veiw.html", [changeset: :changeset, action: "", file_path: path])
  end

end
