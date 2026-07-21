class AddOvertimeInstructionToAttendances < ActiveRecord::Migration[7.1]
  def change
    add_column :attendances, :overtime_instruction, :string
    add_column :attendances, :instructor, :string
  end
end
