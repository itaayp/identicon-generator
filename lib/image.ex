defmodule Identicon.Image do
@moduledoc """
    This module is the `image` struct that will hold all the data inside the application
    `hex property` is the array that contains all the data that generates the Identicon.
    `color property` is the first 3 values of the `hex` and is the RGB color of the Identicon.
    `grid property` is a array containing tuples with the value of the `hex` and it's position on it.
    `pixel_map property` are the `top_left` and the `bottom_right` positions that the even values of `hex` will have on the `Identicon`.
"""
    defstruct hex: nil, color: nil, grid: nil, pixel_map: nil
end