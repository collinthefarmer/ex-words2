defmodule Words.Room do
  import Ecto.Query, warn: false

  import Ecto.Changeset

  alias Words.Repo

  alias Words.Room.Message
  alias Words.Room.Room

  alias Words.Game.Player
  alias Words.Game.Board
  alias Words.Game.Slot

  def get_room!(id) do
    Repo.get!(Room, id) |> Repo.preload(:players) |> Repo.preload(:messages)
  end

  def create_room(player_users) do
    change(%Room{})
    |> put_assoc(
      :players,
      player_users
      |> Enum.with_index()
      |> Enum.map(fn {user, i} ->
        %Player{
          score: 0,
          turn_position: i,
          user_id: user.id
        }
      end)
    )
    |> Repo.insert()
  end

  def create(player_users, board_attrs) do
    board = Board.changeset(%Board{}, board_attrs)

    Ecto.Changeset.change(%Room{})
    |> put_assoc(
      :players,
      player_users
      |> Enum.with_index()
      |> Enum.map(fn {user, i} ->
        %Player{
          score: 0,
          turn_position: i,
          user_id: user.id
        }
      end)
    )
    |> put_assoc(
      :board,
      board
      |> put_assoc(
        :slots,
        0..(board.changes.height * board.changes.width)
        |> Enum.map(fn i ->
          %Slot{
            position: i
          }
        end)
      )
    )
    |> Repo.insert()
  end

  def send_message(body, %Room{} = room, %Player{} = player) do
    msg =
      Message.changeset(%Message{}, %{
        body: body,
        room_id: room.id,
        from_id: player.id
      })

    case msg |> Repo.insert() do
      {:ok, result} -> broadcast_room_event(room, :player_message, result)
      _ -> nil
    end
  end

  def broadcast_room_event(%Room{} = room, type, payload \\ %{}) do
    Phoenix.PubSub.broadcast(
      Words.PubSub,
      "room:#{room.id}",
      %{
        type: type,
        payload: payload
      }
    )
  end

  def subscribe_room_event(%Room{} = room) do
    Phoenix.PubSub.subscribe(Words.PubSub, "room:#{room.id}")
  end
end
