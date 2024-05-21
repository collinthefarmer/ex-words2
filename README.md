# Words

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## todo

- clean up contexts and functions:
- Game
    - context for anything strictly related to the mechanics of the actual game
    - Player
    - Board
    - Slot
    - BoardItem
    - PlayerItem
    - validate_slots
    - adjust_score
    - change_turn
    - fill_slots

- Room
    - Room
    - create_room([players])
        - players assigned on creation, cannot join after created
    - close_room
    - Message
    - send_message

- Users
    - User


## Schema

### User

- name string
- email string

### Room

- turn_position integer

- has_one board Board
- has_many players Player
- has_many messages Message

### Player

- turn_position integer
- score integer

- has_one user User
- has_one board Board
- has_many items PlayerItem

### Message

- body string

- has_one room Room
- has_one from Player

### Board

- width integer
- height integer

- has_many slots Slot
- has_many items BoardItem

### Slot

- position integer

- has_one item BoardItem

- belongs_to Board

- virtual x integer
- virtual y integer

### Item

- glyph string
- value integer



