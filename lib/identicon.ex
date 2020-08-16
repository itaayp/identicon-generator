defmodule Identicon do
@moduledoc """
The module Identicon is responsible to handle all the functions that transforms a string into a identicon.
Identicon is the default profile picture of github. It is a symmetrical image containing .............
"""

@doc """
This function is responsible to call all the other functions in a pipe.
It recieves a string as `input` and returns the `identicon`
"""
  def main(input) do
    input
    |> hash_input

  end

@doc """
This function transforms the `input` string in to a hash
"""
  def hash_input(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list  
  end
end
