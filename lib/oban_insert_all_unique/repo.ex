defmodule ObanInsertAllUnique.Repo do
  use Ecto.Repo,
    otp_app: :oban_insert_all_unique,
    adapter: Ecto.Adapters.Postgres
end
