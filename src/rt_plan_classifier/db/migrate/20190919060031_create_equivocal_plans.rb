class CreateEquivocalPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :equivocal_plans do |t|
      t.string :plan_name
      t.references :canonical_plan, foreign_key: true

      t.timestamps
    end
    add_index :equivocal_plans, :plan_name
  end
end
