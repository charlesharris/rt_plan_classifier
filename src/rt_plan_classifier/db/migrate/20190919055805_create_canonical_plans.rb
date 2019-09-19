class CreateCanonicalPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :canonical_plans do |t|
      t.string :plan_name

      t.timestamps
    end
    add_index :canonical_plans, :plan_name
  end
end
