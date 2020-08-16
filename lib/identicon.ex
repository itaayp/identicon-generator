defmodule Identicon do
@moduledoc """
The module Identicon is responsible to handle all the functions that transforms a string into a identicon.
Identicon is the default profile picture of github. It is a symmetrical image containing 25 squares. And Each square has 50px
"""

    @doc """
    This function is responsible to call all the other functions in a pipe.
    It recieves a string as `input` and returns the `identicon`
    """
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
  end

    @doc """
    This function transforms the `input` string in to a hash
    """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list  

    %Identicon.Image{hex: hex}
  end

  @doc """
  This function get the first 3 indexes from `Identicon.Image{hex}` and uses it to create a color in RGB
  The argument of the function is the struc `Identicon.Image` and we are immediately Pattern Matchin on the definition of the function 
  The return of the function is the struct with the color property updated.
  """
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    #update the struct's color property
    %Identicon.Image{image | color: {r, g, b}}
  end

  @doc """
    This function splits the `%Identicon.Image{hex}` array into a list of smaller lists cointaining each the length of 3 and then mirrors it.
    The return of the function will be an array of array, where each small array will have the length of 5 
  """
  def build_grid(%Identicon.Image{hex: hex} = image) do
      grid = 
        hex
        |> Enum.chunk(3)
        |> Enum.map(&mirror_row/1)
        |> List.flatten
        |> Enum.with_index

      %Identicon.Image{image | grid: grid}
  end

  @doc """
    This function recieve the array `row` as argument and mirrors it's value
  """
  def mirror_row (row) do
      [first, second | _tail] = row

      row ++ [second, first]
  end

  @doc """
    This function filter just the even values of grid and replace it on the struct
    It recieves the struct `image` as parameter and return the same struct with the property `grid` updated.
    This filter is needed because in our image we will paint just the even values 
  """
  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
      grid = Enum.filter grid, fn({code, _index}) ->
        rem(code, 2) == 0
      end

      %Identicon.Image{image | grid: grid}
  end

  @doc """
    This function maps the `top_left` and `bottom_right` pixels of each square that will be painted later.
    The argument is the `image` struct.
    The return of this function is `image` struct with the property `pixel_map` updated 
  """
  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map = Enum.map grid, fn({_code, index}) ->
        horizontal = rem(index, 5) * 50
        vertical = div(index, 5) * 50

        top_left = {horizontal, vertical}
        bottom_right = {horizontal + 50, vertical + 50}

        {top_left, bottom_right}
    end

      %Identicon.Image{image | pixel_map: pixel_map}
  end

end
