defmodule Euler.Question4 do
  @moduledoc """
    This module contains the solution for the 4th question of project Euler

    Question:
    A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
    Find the largest palindrome made from the product of two 3-digit numbers.

    https://projecteuler.net/problem=4
  """

  @doc """
    Solves euler problem 4
  """
  def solve() do
    range = 100..999

    for number1 <- range, number2 <- range do
      number1 * number2
    end
    |> Enum.filter(&is_palindrome?/1)
    |> Enum.max
  end

  def is_palindrome?(input) do
    input_string = Integer.to_string(input)
    input_string == String.reverse(input_string)
  end
end
