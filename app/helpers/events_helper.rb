module EventsHelper
  def show_public(is_public)
    is_public ? "開放" : "不開放"
  end
end
