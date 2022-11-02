defmodule ObanInsertAllUnique.JobTwo do
  @moduledoc false

  use Oban.Worker, queue: :load_test

  require Logger

  def perform(%{args: %{"index" => i}}) do
    Logger.info("Performed job two: #{i}")
  end
end
