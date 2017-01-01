defmodule Euler.Question1 do
  @moduledoc """
    This module contains the solution for the 1th question of project Euler

    Question:
    If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
    Find the sum of all the multiples of 3 or 5 below 1000.

    https://projecteuler.net/problem=1
  """

  @doc """
    Solves euler problem 1
  """
  def solve() do
    0..999
    |> Enum.filter(fn(number) -> rem(number, 3) == 0 or rem(number, 5) == 0 end)
    |> Enum.sum
  end
end
