ExUnit.start

Mix.Task.run "ecto.create", ~w(-r TokyoexHandsonDemo.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r TokyoexHandsonDemo.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(TokyoexHandsonDemo.Repo)

