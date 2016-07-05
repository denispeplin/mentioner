defmodule Mentioner.Usermap do
  @doc """
  Starts a new usermap.
  """
  def start_link do
    table = :ets.new(:usermap, [:set, :public])
    Agent.start_link(fn -> table end, name: Usermap)
  end

  @doc """
  Gets a value from the `usermap` by `key`.
  """
  def get(key) do
    case :ets.lookup(table_link, key) do
      [{^key, value}] -> value
      [] -> nil
    end
  end

  @doc """
  Puts the `value` for the given `key` in the `usermap`.
  """
  def put(key, value) do
    :ets.insert(table_link, {key, value})
  end

  defp table_link do
    Agent.get(Usermap, &(&1))
  end
end
