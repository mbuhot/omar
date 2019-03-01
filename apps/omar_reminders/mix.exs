defmodule Omar.Reminders.MixProject do
  use Mix.Project

  def project do
    [
      app: :omar_reminders,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.8",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Omar.Reminders.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:omar_db, in_umbrella: true},
      {:phoenix, "~> 1.4"},
      {:jason, "~> 1.1"}
    ]
  end
end
