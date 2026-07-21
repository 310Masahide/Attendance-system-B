module ApplicationHelper

  # 時間（小数の時間数）を「時.分」の10進表記で返します（例: 8.5, 19.25, 7.33）
  def format_decimal_time(hours)
    hours.round(2).to_s
  end

  # ページごとにタイトルを返す
  def full_title(page_name = "") # メソッドと引数の定義
    base_title = "AttendanceApp" # 基本となるアプリケーション名を変数に代入
    if page_name.empty? # 引数を受け取っているか判定
      base_title # 引数page_nameが空文字の場合はbase_titleのみ返す
    else # 引数page_nameが空文字ではない場合
      page_name + " | " + base_title # 文字列を連結して返す
    end
  end
end