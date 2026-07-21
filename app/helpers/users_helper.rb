module UsersHelper

  DAYS_OF_THE_WEEK = %w[日 月 火 水 木 金 土].freeze

  # 勤怠基本情報を指定のフォーマットで返します。
  def format_basic_info(time)
    format_decimal_time(((time.hour * 60) + time.min) / 60.0)
  end

  # 指定勤務時間 × 出勤日数で総合勤務時間を返します。
  def total_work_time(user, worked_sum)
    format_decimal_time(((user.work_time.hour * 60) + user.work_time.min) / 60.0 * worked_sum)
  end

  # 日付に対応する曜日（日本語）を返します。
  def day_of_week(date)
    DAYS_OF_THE_WEEK[date.wday]
  end

  # 曜日に応じたテキスト色のCSSクラスを返します（土曜:青、日曜:赤、それ以外:指定なし）。
  def day_of_week_class(date)
    case date.wday
    when 0 then "day-of-week-sunday"
    when 6 then "day-of-week-saturday"
    end
  end
end
