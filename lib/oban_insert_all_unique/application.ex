defmodule ObanInsertAllUnique.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ObanInsertAllUnique.Repo,
      # Start the Telemetry supervisor
      ObanInsertAllUniqueWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ObanInsertAllUnique.PubSub},
      # Start Oban
      {Oban, Application.fetch_env!(:oban_insert_all_unique, :oban)},
      # Start the Endpoint (http/https)
      ObanInsertAllUniqueWeb.Endpoint
      # Start a worker by calling: ObanInsertAllUnique.Worker.start_link(arg)
      # {ObanInsertAllUnique.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ObanInsertAllUnique.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ObanInsertAllUniqueWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
