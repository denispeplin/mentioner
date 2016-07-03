defmodule Mentioner.Usermap do
  @doc """
  Starts a new usermap.
  """
  def start_link do
    Agent.start_link(fn -> %{} end, name: Usermap)
  end

  @doc """
  Gets a value from the `usermap` by `key`.
  """
  def get(key) do
    Agent.get(Usermap, &Map.get(&1, key))
  end

  @doc """
  Puts the `value` for the given `key` in the `usermap`.
  """
  def put(key, value) do
    Agent.update(Usermap, &Map.put(&1, key, value))
  end
end
