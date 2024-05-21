defmodule Words.GameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Words.Game` context.
  """

  @doc """
  Generate a room.
  """
  def room_fixture(attrs \\ %{}) do
    {:ok, room} =
      attrs
      |> Enum.into(%{
        turn_position: 42
      })
      |> Words.Lobby.create_room()

    room
  end

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        score: 42,
        turn_position: 42
      })
      |> Words.Game.create_player()

    player
  end

  @doc """
  Generate a board.
  """
  def board_fixture(attrs \\ %{}) do
    {:ok, board} =
      attrs
      |> Enum.into(%{
        height: 42,
        width: 42
      })
      |> Words.Game.create_board()

    board
  end

  @doc """
  Generate a slot.
  """
  def slot_fixture(attrs \\ %{}) do
    {:ok, slot} =
      attrs
      |> Enum.into(%{
        position: 42
      })
      |> Words.Game.create_slot()

    slot
  end

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        body: "some body"
      })
      |> Words.Game.create_message()

    message
  end

  @doc """
  Generate a player_item.
  """
  def player_item_fixture(attrs \\ %{}) do
    {:ok, player_item} =
      attrs
      |> Enum.into(%{})
      |> Words.Game.create_player_item()

    player_item
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        glyph: "some glyph",
        value: 42
      })
      |> Words.Game.create_item()

    item
  end
end
