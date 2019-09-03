class ChangeYearToString < ActiveRecord::Migration
  def change
    change_column :cards, :year, :string
  end
end
