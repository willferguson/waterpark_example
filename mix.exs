defmodule WaterparkTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :waterpark_test,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [

      extra_applications: [:logger, :waterpark]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:waterpark, git: "https://github.com/willferguson/waterpark.git", tag: "v0.1"},
    ]
  end
end
