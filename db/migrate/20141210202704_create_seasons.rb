class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.date :date

      t.timestamps
    end
  end
end
