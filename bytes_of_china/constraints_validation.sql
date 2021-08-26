SELECT constraint_name, column_name, table_name
FROM information_schema.key_column_usage
WHERE table_name = 'restaurant';

SELECT constraint_name, column_name, table_name
FROM information_schema.key_column_usage
WHERE table_name = 'address';

SELECT constraint_name, column_name, table_name
FROM information_schema.key_column_usage
WHERE table_name = 'category';

SELECT constraint_name, column_name, table_name
FROM information_schema.key_column_usage
WHERE table_name = 'dish';

SELECT constraint_name, column_name, table_name
FROM information_schema.key_column_usage
WHERE table_name = 'review';

SELECT constraint_name, column_name, table_name
FROM information_schema.key_column_usage
WHERE table_name = 'categories_dishes';