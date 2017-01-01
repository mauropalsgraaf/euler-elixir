defmodule Euler.Question6 do
  @moduledoc """
    This module contains the solution for the 6th question of project Euler

    Question:
    The sum of the squares of the first ten natural numbers is, 12 + 22 + ... + 102 = 385
    The square of the sum of the first ten natural numbers is, (1 + 2 + ... + 10)2 = 552 = 3025

    Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
    Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

    https://projecteuler.net/problem=6
  """

  @doc """
    Solves euler problem 6
  """
  def solve() do
    range = 1..100
    sum_of_squares = calculate_sum_of_squares(range)
    square_of_sums = calculate_square_of_sums(range)

   square_of_sums - sum_of_squares
  end

  defp calculate_square_of_sums(range) do
    range
    |> Enum.sum
    |> :math.pow(2)
  end

  defp calculate_sum_of_squares(range) do
    range
    |> Enum.map(fn number -> :math.pow(number, 2) end)
    |> Enum.sum
  end
end
