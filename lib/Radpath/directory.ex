defmodule Radpath.Dirs do
  defmacro __using__([]) do
  quote do
  defp dirs_list(path) when is_list(path) do
    []
  end
  
  def dirs(path) when is_bitstring(path) do
    do_dirs([path], [])
  end

  def dirs(path) when is_list(path) do
    do_dirs(path, [])
  end

  defp do_dirs([], result) do
    result
  end

  defp do_dirs(paths ,result) do
    [h | t] = paths
    result_dirs = dirs_list(h)
    do_dirs(t, result ++ result_dirs)
  end
  
  defp dirs_list(path) when is_bitstring(path) do
    Finder.new() |> Finder.only_directories() |> Finder.find(Path.expand(path)) |> Enum.to_list
  end
  end
  end
end