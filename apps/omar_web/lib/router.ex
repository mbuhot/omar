defmodule Omar.Web.Router do
  use Phoenix.Router

  match(:*, "/reminders/*rest", Omar.Reminders.Router, [])
  match(:*, "/notes/*rest", Omar.Notes.Router, [])
end
