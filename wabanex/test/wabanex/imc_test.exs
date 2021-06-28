defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}

      response = Wabanex.IMC.calculate(params)

      expected_response = {:ok, %{"Alan" => 24.755434782608692, "João" => 30.274725274725274}}

      assert expected_response == response
    end

    test "when the file not exists, returns an error" do
      params = %{"filename" => "student.csv"}

      response = Wabanex.IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert expected_response == response
    end
  end
end
