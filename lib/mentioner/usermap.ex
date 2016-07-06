defmodule Mentioner.Usermap do
  use GenServer

  @doc """
  Starts a new usermap.
  """
  def start_link do
    :dets.open_file(:usermap, [type: :set])
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def terminate do
    :dets.close(:usermap)
  end

  @doc """
  Gets a value from the `usermap` by `key`.
  """
  def get(key) do
    case :dets.lookup(:usermap, key) do
      [{^key, value}] -> value
      [] -> nil
    end
  end

  @doc """
  Delete value by key from `usermap`.
  """
  def delete(key) do
    :dets.delete(:usermap, key)
  end

  @doc """
  Puts the `value` for the given `key` in the `usermap`.
  """
  def put(key, value) do
    :dets.insert(:usermap, {key, value})
  end
end
