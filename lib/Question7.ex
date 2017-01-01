defmodule Euler.Question7 do
  @moduledoc """
    This module contains the solution for the 7th question of project Euler
    The solution is not perfect, but solves the problem within a computational feasable time

    Question:
    By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
    What is the 10 001st prime number?

    https://projecteuler.net/problem=7
  """

  @doc """
    Solves euler problem 7
  """
  def solve() do
    calculate_prime(0, 0, 0)
  end

  @doc """
    Base case for calculating the prime. As soon as 10001 is reached, return that value
  """
  defp calculate_prime(previous_prime, _last_tested, index) when index == 10001 do
    previous_prime
  end

  @doc """
    Recursive function to calculate prime 10001.
    If it's a prime, the previous_prime will be overwritten, last_tested is increased by one aswell as index
    If it's not a prime, previous_prime stays the same, last_tested is increated and index stays the same.
  """
  defp calculate_prime(previous_prime, last_tested, index) when index < 10001 do
    to_test = last_tested + 1
    case is_prime?(to_test) do
      true -> calculate_prime(to_test, to_test, index + 1)
      false -> calculate_prime(previous_prime, to_test, index)
    end
  end

  @doc """
    Verify whether it's a prime number. According to the question, 1 is not a prime number, otherwise 13 would be prime 7
    Since we test a range from 2 till number_to_test - 1, I defined to base cases to prevent weird behaviour.

    This solution is not optimal but does the job. There are more efficient ways to calculate primes
  """
  defp is_prime?(number_to_test) do
    case number_to_test do
      1 -> false
      2 -> true
      _ ->
        2..number_to_test-1
        |> Enum.all?(fn index ->
            division = number_to_test / index
            division != trunc(division)
          end)
    end
  end
end
