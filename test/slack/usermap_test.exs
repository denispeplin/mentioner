defmodule Mentioner.UsermapTest do
  use ExUnit.Case, async: true

  test "stores values by key" do
    Mentioner.Usermap.start_link
    assert Mentioner.Usermap.get("gitlab_user") == nil

    Mentioner.Usermap.put("gitlab_user", "slack_user")
    assert Mentioner.Usermap.get("gitlab_user") == "slack_user"
  end
end
