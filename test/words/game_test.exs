defmodule Words.GameTest do
  use Words.DataCase

  alias Words.Game

  describe "rooms" do
    alias Words.Game.Room

    import Words.GameFixtures

    @invalid_attrs %{turn_position: nil}

    test "list_rooms/0 returns all rooms" do
      room = room_fixture()
      assert Game.list_rooms() == [room]
    end

    test "get_room!/1 returns the room with given id" do
      room = room_fixture()
      assert Game.get_room!(room.id) == room
    end

    test "create_room/1 with valid data creates a room" do
      valid_attrs = %{turn_position: 42}

      assert {:ok, %Room{} = room} = Game.create_room(valid_attrs)
      assert room.turn_position == 42
    end

    test "create_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_room(@invalid_attrs)
    end

    test "update_room/2 with valid data updates the room" do
      room = room_fixture()
      update_attrs = %{turn_position: 43}

      assert {:ok, %Room{} = room} = Game.update_room(room, update_attrs)
      assert room.turn_position == 43
    end

    test "update_room/2 with invalid data returns error changeset" do
      room = room_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_room(room, @invalid_attrs)
      assert room == Game.get_room!(room.id)
    end

    test "delete_room/1 deletes the room" do
      room = room_fixture()
      assert {:ok, %Room{}} = Game.delete_room(room)
      assert_raise Ecto.NoResultsError, fn -> Game.get_room!(room.id) end
    end

    test "change_room/1 returns a room changeset" do
      room = room_fixture()
      assert %Ecto.Changeset{} = Game.change_room(room)
    end
  end

  describe "players" do
    alias Words.Game.Player

    import Words.GameFixtures

    @invalid_attrs %{turn_position: nil, score: nil}

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Game.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Game.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      valid_attrs = %{turn_position: 42, score: 42}

      assert {:ok, %Player{} = player} = Game.create_player(valid_attrs)
      assert player.turn_position == 42
      assert player.score == 42
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      update_attrs = %{turn_position: 43, score: 43}

      assert {:ok, %Player{} = player} = Game.update_player(player, update_attrs)
      assert player.turn_position == 43
      assert player.score == 43
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_player(player, @invalid_attrs)
      assert player == Game.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Game.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Game.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Game.change_player(player)
    end
  end

  describe "boards" do
    alias Words.Game.Board

    import Words.GameFixtures

    @invalid_attrs %{width: nil, height: nil}

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Game.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Game.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      valid_attrs = %{width: 42, height: 42}

      assert {:ok, %Board{} = board} = Game.create_board(valid_attrs)
      assert board.width == 42
      assert board.height == 42
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      update_attrs = %{width: 43, height: 43}

      assert {:ok, %Board{} = board} = Game.update_board(board, update_attrs)
      assert board.width == 43
      assert board.height == 43
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_board(board, @invalid_attrs)
      assert board == Game.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Game.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Game.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Game.change_board(board)
    end
  end

  describe "board_items" do
    alias Words.Game.BoardItem

    import Words.GameFixtures

    @invalid_attrs %{value: nil, glyph: nil}

    test "list_board_items/0 returns all board_items" do
      board_item = board_item_fixture()
      assert Game.list_board_items() == [board_item]
    end

    test "get_board_item!/1 returns the board_item with given id" do
      board_item = board_item_fixture()
      assert Game.get_board_item!(board_item.id) == board_item
    end

    test "create_board_item/1 with valid data creates a board_item" do
      valid_attrs = %{value: 42, glyph: "some glyph"}

      assert {:ok, %BoardItem{} = board_item} = Game.create_board_item(valid_attrs)
      assert board_item.value == 42
      assert board_item.glyph == "some glyph"
    end

    test "create_board_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_board_item(@invalid_attrs)
    end

    test "update_board_item/2 with valid data updates the board_item" do
      board_item = board_item_fixture()
      update_attrs = %{value: 43, glyph: "some updated glyph"}

      assert {:ok, %BoardItem{} = board_item} = Game.update_board_item(board_item, update_attrs)
      assert board_item.value == 43
      assert board_item.glyph == "some updated glyph"
    end

    test "update_board_item/2 with invalid data returns error changeset" do
      board_item = board_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_board_item(board_item, @invalid_attrs)
      assert board_item == Game.get_board_item!(board_item.id)
    end

    test "delete_board_item/1 deletes the board_item" do
      board_item = board_item_fixture()
      assert {:ok, %BoardItem{}} = Game.delete_board_item(board_item)
      assert_raise Ecto.NoResultsError, fn -> Game.get_board_item!(board_item.id) end
    end

    test "change_board_item/1 returns a board_item changeset" do
      board_item = board_item_fixture()
      assert %Ecto.Changeset{} = Game.change_board_item(board_item)
    end
  end

  describe "slots" do
    alias Words.Game.Slot

    import Words.GameFixtures

    @invalid_attrs %{position: nil}

    test "list_slots/0 returns all slots" do
      slot = slot_fixture()
      assert Game.list_slots() == [slot]
    end

    test "get_slot!/1 returns the slot with given id" do
      slot = slot_fixture()
      assert Game.get_slot!(slot.id) == slot
    end

    test "create_slot/1 with valid data creates a slot" do
      valid_attrs = %{position: 42}

      assert {:ok, %Slot{} = slot} = Game.create_slot(valid_attrs)
      assert slot.position == 42
    end

    test "create_slot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_slot(@invalid_attrs)
    end

    test "update_slot/2 with valid data updates the slot" do
      slot = slot_fixture()
      update_attrs = %{position: 43}

      assert {:ok, %Slot{} = slot} = Game.update_slot(slot, update_attrs)
      assert slot.position == 43
    end

    test "update_slot/2 with invalid data returns error changeset" do
      slot = slot_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_slot(slot, @invalid_attrs)
      assert slot == Game.get_slot!(slot.id)
    end

    test "delete_slot/1 deletes the slot" do
      slot = slot_fixture()
      assert {:ok, %Slot{}} = Game.delete_slot(slot)
      assert_raise Ecto.NoResultsError, fn -> Game.get_slot!(slot.id) end
    end

    test "change_slot/1 returns a slot changeset" do
      slot = slot_fixture()
      assert %Ecto.Changeset{} = Game.change_slot(slot)
    end
  end

  describe "messages" do
    alias Words.Game.Message

    import Words.GameFixtures

    @invalid_attrs %{body: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Game.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Game.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{body: "some body"}

      assert {:ok, %Message{} = message} = Game.create_message(valid_attrs)
      assert message.body == "some body"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{body: "some updated body"}

      assert {:ok, %Message{} = message} = Game.update_message(message, update_attrs)
      assert message.body == "some updated body"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_message(message, @invalid_attrs)
      assert message == Game.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Game.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Game.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Game.change_message(message)
    end
  end

  describe "player_items" do
    alias Words.Game.PlayerItem

    import Words.GameFixtures

    @invalid_attrs %{}

    test "list_player_items/0 returns all player_items" do
      player_item = player_item_fixture()
      assert Game.list_player_items() == [player_item]
    end

    test "get_player_item!/1 returns the player_item with given id" do
      player_item = player_item_fixture()
      assert Game.get_player_item!(player_item.id) == player_item
    end

    test "create_player_item/1 with valid data creates a player_item" do
      valid_attrs = %{}

      assert {:ok, %PlayerItem{} = player_item} = Game.create_player_item(valid_attrs)
    end

    test "create_player_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_player_item(@invalid_attrs)
    end

    test "update_player_item/2 with valid data updates the player_item" do
      player_item = player_item_fixture()
      update_attrs = %{}

      assert {:ok, %PlayerItem{} = player_item} =
               Game.update_player_item(player_item, update_attrs)
    end

    test "update_player_item/2 with invalid data returns error changeset" do
      player_item = player_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_player_item(player_item, @invalid_attrs)
      assert player_item == Game.get_player_item!(player_item.id)
    end

    test "delete_player_item/1 deletes the player_item" do
      player_item = player_item_fixture()
      assert {:ok, %PlayerItem{}} = Game.delete_player_item(player_item)
      assert_raise Ecto.NoResultsError, fn -> Game.get_player_item!(player_item.id) end
    end

    test "change_player_item/1 returns a player_item changeset" do
      player_item = player_item_fixture()
      assert %Ecto.Changeset{} = Game.change_player_item(player_item)
    end
  end

  describe "items" do
    alias Words.Game.Item

    import Words.GameFixtures

    @invalid_attrs %{value: nil, glyph: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Game.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Game.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{value: 42, glyph: "some glyph"}

      assert {:ok, %Item{} = item} = Game.create_item(valid_attrs)
      assert item.value == 42
      assert item.glyph == "some glyph"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{value: 43, glyph: "some updated glyph"}

      assert {:ok, %Item{} = item} = Game.update_item(item, update_attrs)
      assert item.value == 43
      assert item.glyph == "some updated glyph"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_item(item, @invalid_attrs)
      assert item == Game.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Game.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Game.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Game.change_item(item)
    end
  end
end
