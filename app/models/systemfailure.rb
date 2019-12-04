class Systemfailure < ApplicationRecord


  def self.csv_attributes
    ["systemfailure_number", "subsystem_name", "occur_date", "title", "department",
      "reporter", "update_deadline", "confirm_deadline", "signal", "status", "hayakawa_comment",
      "chargecomment", "exchange_status", "hayakawa_show", "report_path", "followup", "evidence_update",
      "overall_check", "quality_status", "occurrence_year", "occurrence_month", "permanent_planday", "recurrence_Preventday"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |conts|

conts["systemfailure_number"] = "kkk"
        csv << csv_attributes.map{|attr| conts.send(attr)}
      end
    end
  end

  def self.search(search) #self.でクラスメソッドとしている

    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Systemfailure.where(reporter: search)
    else
      Systemfailure.all #全て表示。
    end
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      if row["systemfailure_number"]
        # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
        systemfailure = find_by(systemfailure_number: row["systemfailure_number"]) || new
        # CSVからデータを取得し、設定する
        systemfailure.attributes = row.to_hash.slice(*updatable_attributes)
        # 保存する
        systemfailure.save
      end
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["systemfailure_number", "subsystem_name", "time", "title", "occur_date", "department", "reporter", "occurrence_year", "occurrence_month"]
  end
end
