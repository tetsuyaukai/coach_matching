module ApplicationHelper
  def formated_date (datetime)
    datetime.in_time_zone('Tokyo').strftime("%Y年%m月%d日")
  end
end
