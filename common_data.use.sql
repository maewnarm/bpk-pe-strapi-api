-- TRUNCATE table
TRUNCATE TABLE strapi.products CASCADE;
SELECT setval('public.products_id_seq', 1, false);
TRUNCATE TABLE strapi.parts CASCADE;
SELECT setval('public.parts_id_seq', 1, false);
TRUNCATE TABLE strapi.lines CASCADE;
SELECT setval('public.lines_id_seq', 1, false);
TRUNCATE TABLE strapi.machines CASCADE;
SELECT setval('public.machines_id_seq', 1, false);

TRUNCATE TABLE strapi.parts_product_links CASCADE;
TRUNCATE TABLE strapi.lines_part_links CASCADE;
TRUNCATE TABLE strapi.machines_line_links CASCADE;

-- INSERT data
DO $$
DECLARE
	t timestamp = current_timestamp;
BEGIN
-- DATA
INSERT INTO strapi.products(
	name, short, created_at, updated_at, published_at, created_by_id, updated_by_id)
	VALUES
	('Alternator', 'ALT', t, t, t, 1, 1),
	('Starter', 'STA', t, t, t, 1, 1),
	('ECC', 'ECC', t, t, t, 1, 1)
	;
INSERT INTO strapi.parts(
  name, short, model, customer, created_at, updated_at, published_at, created_by_id, updated_by_id)
  VALUES
  ('Armature', 'Arm', 'PA70', '', t, t, t, 1, 1)
  ;
INSERT INTO strapi.lines(
  name, section_code, wc_code, created_at, updated_at, published_at, created_by_id, updated_by_id)
  VALUES
  ('Armature 1st line', '4256', 'S230', t, t, t, 1, 1)
  ;
INSERT INTO strapi.machines(
  no, name, index, category, created_at, updated_at, published_at, created_by_id, updated_by_id)
  VALUES
  ('T6SSM', 'Drilling', 1, 'Assembly', t, t, t, 1, 1)
  ;

-- RELATIONSHIP
INSERT INTO strapi.parts_product_links(
  part_id, product_id)
  VALUES
  (1, 1)
  ;
INSERT INTO strapi.lines_part_links(
  line_id, part_id)
  VALUES
  (1, 1)
  ;
INSERT INTO strapi.machines_line_links(
  machine_id, line_id)
  VALUES
  (1, 1)
  ;
END $$;