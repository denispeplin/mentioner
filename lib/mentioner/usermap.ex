defmodule Mentioner.Usermap do
  @doc """
  Starts a new usermap.
  """
  def start_link do
    :dets.open_file(:usermap, [type: :set])
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
  Puts the `value` for the given `key` in the `usermap`.
  """
  def put(key, value) do
    :dets.insert(:usermap, {key, value})
  end
end
