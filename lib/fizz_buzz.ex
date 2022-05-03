defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read
    |> handle_file
  end

  defp handle_file({:ok, content}) do
    result = content
    |> String.split(",")
    |> Enum.map(&convert_numbers/1)

    {:ok, result}
  end
  defp handle_file({:error, reason}), do: "Error reading the file: #{reason}"

  @spec convert_numbers(binary) :: :buzz | :fizz
  defp convert_numbers(elem) do
    elem
    |> String.to_integer
    |> evaluate_number
  end

  @spec evaluate_number(integer) :: :buzz | :fizz
  defp evaluate_number(number) when rem(number, 5) == 0 and rem(number, 3) == 0 , do: :fizzbuzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_number(number), do: number
end
