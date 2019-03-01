defmodule Omar.Reminders.Router do
  use Phoenix.Router
  alias Omar.Reminders

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/reminders" do
    pipe_through([:api])
    post("/", Reminders.CreatePlug, :create, as: :reminders)
    delete("/:id", Reminders.DeletePlug, :delete, as: :reminders)
    get("/health", Reminders.HealthPlug, :show, as: :health)
  end
end
