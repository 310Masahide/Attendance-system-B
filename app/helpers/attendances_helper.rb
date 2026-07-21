module AttendancesHelper

  def attendance_state(attendance)
    # 受け取ったAttendanceオブジェクトが当日と一致するか評価します。
    if Date.current == attendance.worked_on
      return '出勤' if attendance.started_at.nil?
      return '退勤' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    # どれにも当てはまらなかった場合はfalseを返します。
    return false
  end

  # 出勤時間と退勤時間を受け取り、在社時間を計算して返します。
  def working_times(start, finish)
    format_decimal_time(((finish - start) / 60) / 60.0)
  end

  # 時刻を15分単位に切り捨てて返します（例: 08:05 → 08:00, 18:43 → 18:30）。
  def round_down_to_quarter_hour(time)
    return nil if time.blank?
    time.change(min: (time.min / 15) * 15)
  end
end
