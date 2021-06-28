defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}
      response = conn
      |> get(Routes.imc_path(conn, :index, params))
      |> json_response(:ok)

      expected_response = %{"result" => %{"Alan" => 24.755434782608692, "João" => 30.274725274725274}}

      assert expected_response == response
    end


    test "when all params are invalid, returns an error", %{conn: conn} do
      params = %{"filename" => "studen.csv"}
      response = conn
      |> get(Routes.imc_path(conn, :index, params))
      |> json_response(:bad_request)

    expected_response = %{"result" => "Error while opening the file"}

      assert expected_response == response
    end
  end
end
