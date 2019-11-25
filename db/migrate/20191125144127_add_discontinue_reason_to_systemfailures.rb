class AddDiscontinueReasonToSystemfailures < ActiveRecord::Migration[5.2]
  def change
    add_column :systemfailures, :discontinue_reason, :string
    add_column :systemfailures, :measures_deadline, :datetime
    add_column :systemfailures, :to_hayakawa, :string
    add_column :systemfailures, :quality_check, :string
    add_column :systemfailures, :waiting_date_check, :string
    add_column :systemfailures, :review, :string
    add_column :systemfailures, :quality_charge, :string
    add_column :systemfailures, :quality_check_result, :string
    add_column :systemfailures, :quality_comment, :string
    add_column :systemfailures, :warning_count, :string
  end
end
