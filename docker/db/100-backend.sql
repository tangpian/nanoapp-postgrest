\c backend;

BEGIN;

CREATE TABLE platform.todos (
	id uuid NOT NULL DEFAULT gen_random_uuid(),
	created_at timestamptz NOT NULL DEFAULT now(),
	updated_at timestamptz NOT NULL DEFAULT now(),
	"title" text NOT NULL,
	description text NULL,
	"valid" bool NULL DEFAULT true,
	CONSTRAINT tenants_pkey PRIMARY KEY (id)
);

INSERT INTO platform.todos (id,created_at,updated_at,title,description,"valid") VALUES
	 ('acec8216-77e9-4076-be4b-aeb949258eb1','2024-01-31 21:11:53.588','2024-01-31 21:11:53.588','important & not urgent','schedule',true),
	 ('29ef79b6-73f7-4570-8b3c-7905398d891b','2024-01-31 21:11:53.597','2024-01-31 21:11:53.597','not import & urgent','delegate',true),
	 ('2bdd0144-f912-4ff5-a9f1-a55744b2191f','2024-01-31 21:11:53.601','2024-01-31 21:11:53.601','not important & not urgent','delete',true),
	 ('d8cccd9e-4711-465a-9c4d-7395bb5d2d61','2024-01-31 21:07:40.965','2024-01-31 21:07:40.965','important & urgent','do',true);


COMMIT;
