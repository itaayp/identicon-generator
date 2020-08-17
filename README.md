# Identicon

**This is my second Elixir application. It is part of "The Complete Elixir and Phoenix Bootcamp and Tutorial" course, avaliable at https://udemy.com/course/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/**

## Identicons
Identicons are the default Github profile pictures. Each picture is unique per user!
In my application I'm creating a unique **Identicon** for each word that you pass as parameter to the `main(word)` function.

## Application usage
In order to run this application, you need to install Elixir in your PC (you can install it from the official website: https://elixir-lang.org/install.html).
If Elixir is already installed, you can download the source code of this application to your PC, open your prefered terminal, navigate to the root folder of the application and run the following command:
``iex -S mix``.

After that call the function, changing the "my identicon" example `Identicon.main("my identicon")`.
Now you have just created your Identicon! Open your file explorer at the root folder of the application and open the `.png` named with your word.

## Elixir concepts and frameworks applied to this project
  1- Exdoc Framework - to generate the documentation
  2- EDG Framework - to generate the images
  3- Structs
