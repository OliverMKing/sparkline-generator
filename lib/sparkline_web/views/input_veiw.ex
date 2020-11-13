defmodule SparklineWeb.InputView do
  use SparklineWeb, :view

  def csv(path) do
    File.stream!(path)
    |> CSV.decode!
    |> Enum.to_list
    |> to_string
  end
end
