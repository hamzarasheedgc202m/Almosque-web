defmodule AlmosqueWeb.Test do
  use AlmosqueWeb, :live_view

  def mount(_params, _session, socket) do
    data = [
      %{name: "FAJR", time_start: "05:45 AM", time_end: "05:45 AM"},
      %{name: "DHUHR", time_start: "11:35 AM", time_end: "12:15 PM"},
      %{name: "ASR", time_start: "02:15 PM", time_end: "02:25 PM"},
      %{name: "MAGHRIB", time_start: "04:15 PM", time_end: "04:25 PM"},
      %{name: "ISHA", time_start: "05:45 PM", time_end: "06:00 PM"}
    ]

    data2 = [
      %{sun: "SUNRISE", time: "06:15 AM"},
      %{sun: "SUNSET", time: "04:15 PM"}
    ]

    {:ok,
     socket
     |> assign(data: data)
     |> assign(data2: data2)
     |> assign(show_reminder: false)
     |> assign(show_mosque: false)
     |> assign(show_sync: false)
     |> assign(show_stand_alone: false)
     |> assign(show_general: false)}
  end

  def handle_event("reminder_view", _params, socket) do
    {:noreply,
     socket
     |> assign(
       show_reminder: true,
       show_mosque: false,
       show_general: false
     )}
  end

  def handle_event("mosque_view", _params, socket) do
    {:noreply,
     socket
     |> assign(
       show_mosque: true,
       show_reminder: false,
       show_general: false,
       show_sync: false,
       show_stand_alone: false
     )}
  end

  def handle_event("sync_view", _params, socket) do
    {:noreply,
     socket
     |> assign(
       show_sync: true,
       show_mosque: true,
       show_stand_alone: false,
       show_general: false,
       show_reminder: false
     )}
  end

  def handle_event("stand_alone_view", _params, socket) do
    {:noreply,
     socket
     |> assign(
       show_stand_alone: true,
       show_mosque: true,
       show_sync: false,
       show_general: false,
       show_reminder: false
     )}
  end

  def handle_event("general_view", _params, socket) do
    {:noreply,
     socket
     |> assign(
       show_general: true,
       show_mosque: false,
       show_reminder: false
     )}
  end

  def handle_event("go_back", _params, socket) do
    {:noreply,
     assign(socket,
       show_reminder: false,
       show_mosque: false,
       show_general: false,
       show_sync: false,
       show_stand_alone: false
     )}
  end
end
