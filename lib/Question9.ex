defmodule Euler.Question9 do
  @moduledoc """
    This module contains the solution for the 9th question of project Euler

    Question:
    A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a2 + b2 = c2
    For example, 32 + 42 = 9 + 16 = 25 = 52.

    There exists exactly one Pythagorean triplet for which a + b + c = 1000.
    Find the product abc.

    https://projecteuler.net/problem=9
  """

  @doc """
    Solves euler problem 9
  """
  def solve() do
    {a, b, c} = 1..998
    |> Enum.map(fn a ->
        1..998-a
        |> Enum.map(fn number -> {a, number, 1000 - number - a} end)
      end)
    |> List.flatten
    |> Enum.find(&verify_triplet/1)

    a * b * c
  end

  def verify_triplet({a, b, c}) do
    a + b + c == 1000 && :math.pow(a, 2) + :math.pow(b, 2) == :math.pow(c, 2)
  end
end
