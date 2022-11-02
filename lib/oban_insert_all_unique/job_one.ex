defmodule ObanInsertAllUnique.JobOne do
  @moduledoc false

  use Oban.Worker, queue: :load_test

  require Logger

  def perform(%{args: %{"index" => i}}) do
    Logger.info("Performed job one: #{i}")
  end
end
