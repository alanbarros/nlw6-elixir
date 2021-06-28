defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.{User, Users.Create}

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{email: "alan@wabanex.com", name: "Alan", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}"){
            id
            email,
            name
          }
        }
      """

      response = conn
      |> post("/api/graphql", %{query: query})
      |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "alan@wabanex.com",
            "id" => "#{user_id}",
            "name" => "Alan"
          }
        }
      }

      assert expected_response == response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do

      mutation = """
          mutation {
            createUser(input:
            {
              name: "Margarida",
              email: "margarida@gmail.com",
              password: "123456"
            })
            {
              id,
              name,
              email
            }
          }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{
        "data" => %{
          "createUser" => %{
            "id" => _id,
            "name" => "Margarida",
            "email" => "margarida@gmail.com"
          }
        }
      } = response
    end
  end
end
