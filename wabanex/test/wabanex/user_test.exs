defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  describe "changeset/1" do
    test "when all params are valid, returns a valid changset" do
      params = %{name: "Alan", email: "alan@wabanex.com", password: "123456"}

      response = Wabanex.User.changeset(params)

      assert %Ecto.Changeset{
        changes: %{
          email: "alan@wabanex.com", name: "Alan", password: "123456"},
          errors: [],
          valid?: true
        } = response
    end

    test "when all params are invalid, returns an invalid changset" do
      params = %{name: "A", email: "alan2wabanex.com"}

      response = Wabanex.User.changeset(params)

      expected_response = %{
        email: ["has invalid format"],
        name: ["should be at least 2 character(s)"],
        password: ["can't be blank"]
      }

      assert errors_on(response) == expected_response
    end
  end

end
