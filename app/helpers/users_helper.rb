module UsersHelper

  DAYS_OF_THE_WEEK = %w[日 月 火 水 木 金 土].freeze

  # 勤怠基本情報を指定のフォーマットで返します。
  def format_basic_info(time)
    format("%.2f", ((time.hour * 60) + time.min) / 60.0)
  end

  # 日付に対応する曜日（日本語）を返します。
  def day_of_week(date)
    DAYS_OF_THE_WEEK[date.wday]
  end
end
