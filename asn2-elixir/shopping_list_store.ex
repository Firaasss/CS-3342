##############################################################################
# Assignment : 5
# Author     : FIRAS ABOUSHAMALAAH
# Email      : fabousha@uwo.ca
# 
# Brief description of the contents of the file
##############################################################################

defmodule ShoppingListStore do

  # Path to the shopping list files (db/lists/*)
  # Don't forget to create this directory if it doesn't exist
  @database_directory Path.join("db", "lists")

  def start() do
    loop()
  end

  defp loop() do
    receive do
      {caller, :clear} ->
        clear(caller)
        loop()


      #sending list msg
      {caller, :list, username} ->
        loadList(caller, username)
        loop()

      {caller, :add, username, item} ->
        add(caller, username, item)
        loop()

      {caller, :delete, username, item} ->
        delete(caller, username, item)
        loop()

      {caller, :exit} ->
        IO.puts "ShoppingListStore shutting down"

      _ ->
        loop()
    end

  end

  #creates the directory if it is not there
  defp createDir(directory) do
    if File.exists?(directory) == true do
      IO.puts "Directory exists."
    else
      File.mkdir(directory)
      IO.puts "New directory created."
    end
  end

  #creates the .txt file if it is not there
  defp createFile(fileName) do
    if File.exists?(fileName) == true do
      IO.puts "Text file exists."
    else
      File.open(fileName, [:write])
      IO.puts "Text file created."
    end
  end

  #delete function helper
  defp delete(caller, username, item) do
    createDir(@database_directory)
    createFile(user_db(username)) 
    {:ok, listItems} = File.read(user_db(username))  #
    items = listItems |> String.split("\n", trim: true) |> Enum.sort()
    if Enum.member?(items, item) == false do
      send(caller, {self(), :not_found, username, item})
    else
      newList = List.delete(items, item)
      File.write(user_db(username), newList, [:write])
      send(caller, {self(), :deleted, username, item})
    end
  end

  defp add(caller, username, item) do
    createDir(@database_directory)
    createFile(user_db(username))
    {:ok, listItems} = File.read(user_db(username))
    items = listItems |> String.split("\n", trim: true) |> Enum.sort()
    if Enum.member?(items, item) == false do
      File.write(user_db(username), "#{item}\n", [:append])
      send(caller, {self(), :added, username, item})
    else
      send(caller, {self(), :exists, username, item})
    end
  end

  defp loadList(caller, username) do
    createDir(@database_directory)
    createFile(user_db(username))
    {:ok, listItems} = File.read(user_db(username))
    items = listItems |> String.split("\n", trim: true) |> Enum.sort()
    send(caller, {self(), :list, username, items})
  end

  defp clear(caller) do
    File.rm_rf(@database_directory)
    send(caller, {self(), :cleared})
  end

  # Path to the shopping list file for the specified user
  # (db/lists/USERNAME.txt)
  defp user_db(username), do: Path.join(@database_directory, "#{username}.txt")


end
