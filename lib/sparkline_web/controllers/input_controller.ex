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

    # Turns file into list of ints
    nums = Enum.map(String.split(text, ", ", trim: true), fn x -> elem(Integer.parse(x), 0) end)

    # Finds max and min
    [head | _tail] = nums
    {min, max} = Enum.reduce(nums, {head, head}, fn(num, {min, max}) ->
      {Enum.min([num, min]), Enum.max([num, max])}
    end)

    # Calculates image details
    height = 23
    width = 189
    step = width / (length(nums) - 1)
    reversedNums = Enum.map(nums, fn x -> -x end)

    # Calculates image points
    # 0, 0 is top left
    # increasing x and y go to bottom right
    shiftedNums = Enum.map(reversedNums, fn x -> x + max end)
    scale = (max - min) / height
    scaledNums = Enum.map(shiftedNums, fn x -> x / scale end)
    points = scaledNums
      |> Enum.with_index
      |> Enum.map(fn{y, index} -> [index * step, y] end)

    render(conn, "input_veiw.html", [changeset: :changeset, action: "", points: points, height: height, width: width])
  end

end
