defmodule Euler.Question11 do

  @type grid :: list(row)
  @type row :: list(integer)

  def solve() do
    grid = create_grid()
    max_left_right =
      grid
      |> compute_largest_multiplication

    max_top_down =
      grid
      |> transform_top_bottom_grid_to_left_right_grid
      |> compute_largest_multiplication

    max_diagonal =
      grid
      |> transform_diagonal_grid_to_left_right_grid
      |> compute_largest_multiplication

    [max_left_right, max_top_down, max_diagonal]
    |> Enum.max
  end

  @doc """
    Transform a diagonal grid to a left right grid. This will make sure it will be possible to use the same
    computation function to find largest multiplication
  """
  @spec transform_top_bottom_grid_to_left_right_grid(grid) :: grid
  def transform_top_bottom_grid_to_left_right_grid(grid) do
    transform_top_bottom_grid_to_left_right_grid(grid, [])
  end

  def transform_top_bottom_grid_to_left_right_grid([head | _tail] = _grid, columns) when length(head) == 0 do
    columns
  end

  def transform_top_bottom_grid_to_left_right_grid(grid, columns) do
    column =
      grid
      |> Enum.map(fn [head | _tail] -> head end)

    new_columns = columns ++ [column]

    new_grid =
      grid
      |> Enum.map(fn [_head | tail] -> tail end)

    transform_top_bottom_grid_to_left_right_grid(new_grid, new_columns)
  end

  @doc """
    Transform a diagonal grid to a left right grid. This will make sure it will be possible to use the same
    computation function to find largest multiplication
  """
  @spec transform_diagonal_grid_to_left_right_grid(grid) :: grid
  def transform_diagonal_grid_to_left_right_grid(grid) do
    grid
      |> List.flatten
      |> transform_diagonal_grid_to_left_right_grid([])
  end

  def transform_diagonal_grid_to_left_right_grid(grid, _columns) do
    diagonal_left_bottom_right_top =
      0..399
      |> Enum.map(fn number ->
        {_, first} = Enum.fetch(grid, number)
        {_, second} = Enum.fetch(grid, rem(number + 20 - 1, 400))
        {_, third} = Enum.fetch(grid, rem(number + 40 - 2, 400))
        {_, fourth} = Enum.fetch(grid, rem(number + 60 - 3, 400))

        [first, second, third, fourth]
      end)

    diagonal_left_top_right_bottom =
      0..399
      |> Enum.map(fn number ->
        {_, first} = Enum.fetch(grid, number)
        {_, second} = Enum.fetch(grid, rem(number + 20 + 1, 400))
        {_, third} = Enum.fetch(grid, rem(number + 40 + 2, 400))
        {_, fourth} = Enum.fetch(grid, rem(number + 60 + 3, 400))

        [first, second, third, fourth]
      end)

      diagonal_left_top_right_bottom ++ diagonal_left_bottom_right_top

  end

  @doc """
    Computes the largest multiplication of 4 items in a grid.

    Given a grid: [[1, 5, 7, 2, 3, 5],[7, 3, 2, 5, 3, 7],[9, 1, 4, 2, 6, 3]]
    Result: 210, because 5 * 7 * 2 * 3 provides the largest multiplication of 4 consecutive numbers


  ## Examples

      iex> Euler.Question11.compute_largest_multiplication [[1, 5, 7, 2, 3, 5],[7, 3, 2, 5, 3, 7],[9, 1, 4, 2, 6, 3]]
      210

  """
  @spec compute_largest_multiplication(grid) :: integer
  def compute_largest_multiplication(grid) do
    grid
    |> Enum.map(fn list -> list |> Enum.chunk(4, 1) end)
    |> Enum.map(fn row ->
      row
      |> Enum.map(fn pair_of_row -> pair_of_row |> Enum.reduce(fn x, acc -> acc * x end) end)
    end)
    |> List.flatten
    |> Enum.max
  end

  @doc """
    Creates a grid out of the provided integer in the Euler Question 11
  """
  @spec create_grid() :: grid
  def create_grid do
    # Since its starting with a 0, converting to a char_list will result in the 0 omitted. Thats why I've added a prefix to make sure the 0 wont be omitted
    108022297381500400075040507785212507791084949994017811857608717409843694804566200814931735579142993714067538830034913366552709523046011426924685601325671370236912231167151676389419236542240402866331380244732609903450244753353783684203517125032988128642367102638406759547066183864706726206802621220956394396308409166499421245558056673992697177878968314883489637221362309750076442045351400613397343133957817532822753167159403800462161409535692163905429635314755588824001754243629855786560048357189070544443744602158515417581980816805944769287392138652177704895540045208839735991607975732162626793327986688366887576220720346336746551232639353690442167338253911249472180846293240627636206936417230238834629969826759857404361620733529783190017431497148868116235705540170547183515469169233486143520189196748
    |> Integer.digits
    |> tl # filter out the first added pair
    |> Enum.chunk(2)
    |> Enum.map(&Integer.undigits/1)
    |> Enum.chunk(20)
  end
end
