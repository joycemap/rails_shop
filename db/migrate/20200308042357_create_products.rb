class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :stripe_plan_name
    end
    add_monetize :products, :price, currency: { present: true }
  end
end
