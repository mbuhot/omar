defmodule Omar.Notes.Router do
  use Phoenix.Router
  alias Omar.Notes

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/notes" do
    pipe_through([:api])
    post("/", Notes.CreatePlug, :create, as: :notes)
    delete("/:id", Notes.DeletePlug, :delete, as: :notes)
    get("/health", Notes.HealthPlug, :show, as: :health)
  end
end
