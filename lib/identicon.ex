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
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
  end

  @doc """
    This function recieve the array `row` as argument and mirrors it's value
  """
  def mirror_row (row) do
      [first, second | _tail] = row

      row ++ [second, first]
  end
end
