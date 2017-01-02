defmodule Euler.Question10 do
  def solve() do
    get_list_of_primes([], 1, 2000000)
    |> Enum.reduce(fn(x, acc) -> acc + x end)
  end

  defp get_list_of_primes(list, index, max) when index == max do
    list
  end

  defp get_list_of_primes(list, index, max) do
    case is_prime?(index, list) do
      true -> get_list_of_primes(list ++ [index], index + 1, max)
      false -> get_list_of_primes(list, index + 1, max)
    end
  end

  defp is_prime?(number_to_test, lower_primes) do
    case number_to_test do
      1 -> false
      2 -> true
      3 -> true
      4 -> false
      5 -> true
      _ ->
        2..5
        |> Enum.concat(lower_primes)
        |> Enum.all?(fn index ->
            division = number_to_test / index
            division != trunc(division)
          end)
    end
  end
end
