class CreateTeaSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :tea_subscriptions do |t|
      t.string :title
      t.string :price
      t.string :status
      t.string :frequency
      t.references :tea, foreign_key: true
      t.references :customer, foreign_key: true
    end
  end
end
