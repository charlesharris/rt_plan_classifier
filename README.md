# rt_plan_classifier
POC for discussing mapping many equivocal plans to a canonical plan.

## Installing and running locally
To run locally, create a .env with the following contents:
```
MODE=development
DBHOST=localhost
DBNAME=rt_plan_classifier_dev
DBUSER=rt_plan_classifier
DBPASSWORD=rt_plan_classifier
```

Run docker-compose:
`docker-compose --build`

This will set up an initial database if one doesn't already exist, run migrations, and start rails.

### Seeding plans
By default, this creates 1000 canonical plans, each with 1000 equivocal plans.

Exec into the rails app container, and run `rake db:seed`:
```
[$] <> docker exec -it rt_plan_classifier bash
root@60d350c9f5de:/opt/rt_plan_classifier# rake db:seed
root@60d350c9f5de:/opt/rt_plan_classifier#
```

## Overview and Considerations

This is a super basic Rails app with two models: CanonicalPlan, and EquivocalPlan.

I chose this approach because everyone understands Rails models and database tables.
Sticking to simple, well-understood structures like tables with indexes and references scales well, and affords many options for handling more advanced scaling needs than "add more RAM".  It also scales out across developers because it is so familiar, and is well-supported by various tools, gems, etc..  Scaling across developers is important generally, but is particularly important within engineering orgs experiencing rapid growth.

In order to find the canonical plan for a given plan name is pretty fast:
```
[1] pry(main)> EquivocalPlan.includes(:canonical_plan).find_by_plan_name!('EQ Plan 42 for Canonical Health Plan 842').canonical_plan
EquivocalPlan Load (0.4ms)  SELECT  "equivocal_plans".* FROM "equivocal_plans" WHERE "equivocal_plans"."plan_name" = $1 LIMIT $2  [["plan_name", "EQ Plan 42 for Canonical Health Plan 842"], ["LIMIT", 1]]
CanonicalPlan Load (0.3ms)  SELECT "canonical_plans".* FROM "canonical_plans" WHERE "canonical_plans"."id" = $1  [["id", 842]]
=> #<CanonicalPlan:0x000056235dcef3c0 id: 842, plan_name: "Canonical Health Plan 842", created_at: Thu, 19 Sep 2019 10:02:02 UTC +00:00, updated_at: Thu, 19 Sep 2019 10:02:02 UTC +00:00>

[2] pry(main)> EquivocalPlan.includes(:canonical_plan).where(plan_name: 'EQ Plan 42 for Canonical Health Plan 842').joins(:canonical_plan).first.canonical_plan
SQL (2.6ms)  SELECT  "equivocal_plans"."id" AS t0_r0, "equivocal_plans"."plan_name" AS t0_r1, "equivocal_plans"."canonical_plan_id" AS t0_r2, "equivocal_plans"."created_at" AS t0_r3, "equivocal_plans"."updated_at" AS t0_r4, "canonical_plans"."id" AS t1_r0, "canonical_plans"."plan_name" AS t1_r1, "canonical_plans"."created_at" AS t1_r2, "canonical_plans"."updated_at" AS t1_r3 FROM "equivocal_plans" INNER JOIN "canonical_plans" ON "canonical_plans"."id" = "equivocal_plans"."canonical_plan_id" WHERE "equivocal_plans"."plan_name" = $1 ORDER BY "equivocal_plans"."id" ASC LIMIT $2  [["plan_name", "EQ Plan 42 for Canonical Health Plan 842"], ["LIMIT", 1]]
=> #<CanonicalPlan:0x000056235dbe25e0 id: 842, plan_name: "Canonical Health Plan 842", created_at: Thu, 19 Sep 2019 10:02:02 UTC +00:00, updated_at: Thu, 19 Sep 2019 10:02:02 UTC +00:00>
```

This example is obviously a bit contrived, since this is a local test with no load, network latency, etc., but I would expect this solution would continue to be performant as load and usage increase.

This approach can be scaled out horizontally if necessary (that'd be a Good Problem To Have), by partitioning the data.  Consideration on how to approach this partioning would have to include usage patterns and the actual plan name data, but might include partioning by the source of the data, or by the plan name (probably hashed for more consistent distribution across partitions).

Other approaches might include offloading this mapping to something like Redis, or really any persisted key-value store that fits the needs of the app, be they performance, cost, available support, functionality, etc..

Regardless of the underlying tech stack, this is probably a good candidate to consider breaking out into a small, focused service that exposes a very simple API.

