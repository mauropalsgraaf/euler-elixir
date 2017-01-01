defmodule Euler.Question5 do
  @moduledoc """
    This module contains the solution for the 5th question of project Euler

    Question:
    2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
    What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

    https://projecteuler.net/problem=5
  """

  @doc """
    Solves euler problem 5
  """
  def solve() do
    # If its dividable by all of these numbers, they are also dividable by 1..10
    range = 11..20
    calculate(1, range)
  end

  def calculate(number_to_verify, range) do
    is_dividable_by_range =
      range
      |> Enum.all?(fn number ->
          division = number_to_verify / number
          division == trunc(division)
        end)

    case is_dividable_by_range do
      true -> number_to_verify
      false -> calculate(number_to_verify + 1, range)
    end
  end
end
