defmodule Omar.Web.Router do
  use Phoenix.Router

  match :*, "/reminders/*rest", Omar.Reminders.Router, []

end
