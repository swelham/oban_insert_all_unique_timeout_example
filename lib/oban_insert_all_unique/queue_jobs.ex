defmodule ObanInsertAllUnique.QueueJobs do
  @moduledoc false

  alias ObanInsertAllUnique.{JobOne, JobTwo}
  alias ObanInsertAllUnique.Repo

  def enqueue do
    all_data =
      for i <- 1..15_000 do
        %{index: i}
      end

    Repo.transaction(fn _ ->
      all_data
      |> Enum.chunk_every(1000)
      |> Enum.each(&enqueue_jobs/1)

      {:ok, nil}
    end)
  end

  defp enqueue_jobs(data) do
    first_jobs =
      Enum.map(data, fn i ->
        %{index: i}
        |> JobOne.new(unique: [period: 60])
      end)

    second_jobs =
      Enum.map(data, fn i ->
        %{index: i}
        |> JobTwo.new(unique: [period: 60])
      end)

    Oban.insert_all(first_jobs)
    Oban.insert_all(second_jobs)
  end
end
