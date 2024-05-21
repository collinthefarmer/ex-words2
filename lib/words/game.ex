defmodule Words.Game do
  @moduledoc """
  The Game context.
  """

  import Ecto.Query, warn: false
  alias Words.Repo

  alias Words.Game.Player

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players do
    Repo.all(Player)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Repo.get!(Player, id)

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{data: %Player{}}

  """
  def change_player(%Player{} = player, attrs \\ %{}) do
    Player.changeset(player, attrs)
  end

  alias Words.Game.Board

  @doc """
  Returns the list of boards.

  ## Examples

      iex> list_boards()
      [%Board{}, ...]

  """
  def list_boards do
    Repo.all(Board)
  end

  @doc """
  Gets a single board.

  Raises `Ecto.NoResultsError` if the Board does not exist.

  ## Examples

      iex> get_board!(123)
      %Board{}

      iex> get_board!(456)
      ** (Ecto.NoResultsError)

  """
  def get_board!(id), do: Repo.get!(Board, id)

  @doc """
  Creates a board.

  ## Examples

      iex> create_board(%{field: value})
      {:ok, %Board{}}

      iex> create_board(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_board(attrs \\ %{}) do
    %Board{}
    |> Board.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a board.

  ## Examples

      iex> update_board(board, %{field: new_value})
      {:ok, %Board{}}

      iex> update_board(board, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_board(%Board{} = board, attrs) do
    board
    |> Board.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a board.

  ## Examples

      iex> delete_board(board)
      {:ok, %Board{}}

      iex> delete_board(board)
      {:error, %Ecto.Changeset{}}

  """
  def delete_board(%Board{} = board) do
    Repo.delete(board)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking board changes.

  ## Examples

      iex> change_board(board)
      %Ecto.Changeset{data: %Board{}}

  """
  def change_board(%Board{} = board, attrs \\ %{}) do
    Board.changeset(board, attrs)
  end

  alias Words.Game.BoardItem

  @doc """
  Returns the list of board_items.

  ## Examples

      iex> list_board_items()
      [%BoardItem{}, ...]

  """
  def list_board_items do
    Repo.all(BoardItem)
  end

  @doc """
  Gets a single board_item.

  Raises `Ecto.NoResultsError` if the Board item does not exist.

  ## Examples

      iex> get_board_item!(123)
      %BoardItem{}

      iex> get_board_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_board_item!(id), do: Repo.get!(BoardItem, id)

  @doc """
  Creates a board_item.

  ## Examples

      iex> create_board_item(%{field: value})
      {:ok, %BoardItem{}}

      iex> create_board_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_board_item(attrs \\ %{}) do
    %BoardItem{}
    |> BoardItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a board_item.

  ## Examples

      iex> update_board_item(board_item, %{field: new_value})
      {:ok, %BoardItem{}}

      iex> update_board_item(board_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_board_item(%BoardItem{} = board_item, attrs) do
    board_item
    |> BoardItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a board_item.

  ## Examples

      iex> delete_board_item(board_item)
      {:ok, %BoardItem{}}

      iex> delete_board_item(board_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_board_item(%BoardItem{} = board_item) do
    Repo.delete(board_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking board_item changes.

  ## Examples

      iex> change_board_item(board_item)
      %Ecto.Changeset{data: %BoardItem{}}

  """
  def change_board_item(%BoardItem{} = board_item, attrs \\ %{}) do
    BoardItem.changeset(board_item, attrs)
  end

  alias Words.Game.Slot

  @doc """
  Returns the list of slots.

  ## Examples

      iex> list_slots()
      [%Slot{}, ...]

  """
  def list_slots do
    Repo.all(Slot)
  end

  @doc """
  Gets a single slot.

  Raises `Ecto.NoResultsError` if the Slot does not exist.

  ## Examples

      iex> get_slot!(123)
      %Slot{}

      iex> get_slot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_slot!(id), do: Repo.get!(Slot, id)

  @doc """
  Creates a slot.

  ## Examples

      iex> create_slot(%{field: value})
      {:ok, %Slot{}}

      iex> create_slot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_slot(attrs \\ %{}) do
    %Slot{}
    |> Slot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a slot.

  ## Examples

      iex> update_slot(slot, %{field: new_value})
      {:ok, %Slot{}}

      iex> update_slot(slot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_slot(%Slot{} = slot, attrs) do
    slot
    |> Slot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a slot.

  ## Examples

      iex> delete_slot(slot)
      {:ok, %Slot{}}

      iex> delete_slot(slot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_slot(%Slot{} = slot) do
    Repo.delete(slot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking slot changes.

  ## Examples

      iex> change_slot(slot)
      %Ecto.Changeset{data: %Slot{}}

  """
  def change_slot(%Slot{} = slot, attrs \\ %{}) do
    Slot.changeset(slot, attrs)
  end

  alias Words.Game.PlayerItem

  @doc """
  Returns the list of player_items.

  ## Examples

      iex> list_player_items()
      [%PlayerItem{}, ...]

  """
  def list_player_items do
    Repo.all(PlayerItem)
  end

  @doc """
  Gets a single player_item.

  Raises `Ecto.NoResultsError` if the Player item does not exist.

  ## Examples

      iex> get_player_item!(123)
      %PlayerItem{}

      iex> get_player_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player_item!(id), do: Repo.get!(PlayerItem, id)

  @doc """
  Creates a player_item.

  ## Examples

      iex> create_player_item(%{field: value})
      {:ok, %PlayerItem{}}

      iex> create_player_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player_item(attrs \\ %{}) do
    %PlayerItem{}
    |> PlayerItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player_item.

  ## Examples

      iex> update_player_item(player_item, %{field: new_value})
      {:ok, %PlayerItem{}}

      iex> update_player_item(player_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player_item(%PlayerItem{} = player_item, attrs) do
    player_item
    |> PlayerItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player_item.

  ## Examples

      iex> delete_player_item(player_item)
      {:ok, %PlayerItem{}}

      iex> delete_player_item(player_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player_item(%PlayerItem{} = player_item) do
    Repo.delete(player_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player_item changes.

  ## Examples

      iex> change_player_item(player_item)
      %Ecto.Changeset{data: %PlayerItem{}}

  """
  def change_player_item(%PlayerItem{} = player_item, attrs \\ %{}) do
    PlayerItem.changeset(player_item, attrs)
  end

  alias Words.Game.Item

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    Repo.all(Item)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end
end
