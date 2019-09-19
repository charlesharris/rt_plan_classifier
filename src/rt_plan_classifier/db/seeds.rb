max_c_plans = 1000
e_plans_per_c_plan = 1000

ActiveRecord::Base.transaction do
  (1..max_c_plans).each do |plan_number|
    canonical_plan_name = "Canonical Health Plan #{plan_number}"
    canonical_plan = CanonicalPlan.create({plan_name: canonical_plan_name})

    eplans = []
    (1..e_plans_per_c_plan).each do |eq_plan_number|
      eplans << {plan_name: "EQ Plan #{eq_plan_number} for #{canonical_plan_name}", canonical_plan_id: canonical_plan.id}
    end
    EquivocalPlan.import(eplans, validate: false)
  end
end
