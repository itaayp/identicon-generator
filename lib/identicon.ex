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
end
