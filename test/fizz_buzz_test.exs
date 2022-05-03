defmodule FizzBuzzTest do
  use ExUnit.Case
  doctest FizzBuzz

  describe "build/1" do
    test "when a valid file is provided, returns the converted list" do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :buzz]}
      assert FizzBuzz.build("numbers.txt") == expected_response
    end
    test "when a invalid file is provided, returns an error" do
      error_message = "Error reading the file: enoent"
      assert FizzBuzz.build("numbersasas.txt") == error_message
    end
  end
end
