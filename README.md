# ObanInsertAllUnique

*Before following the setups below, be sure to install deps and run migrations.*

To reproduce the timeout, open the application with iex.
```sh
iex -S mix phx.server
```

Next, run the function that enqueues the jobs.
```elixir
iex> ObanInsertAllUnique.QueueJobs.enqueue()
```

Once this has run for a while, you will see the following error.
```
[error] Postgrex.Protocol (#PID<0.375.0>) disconnected: ** (DBConnection.ConnectionError) client #PID<0.538.0> timed out because it queued and checked out the connection for longer than 15000ms
```
