SELECT LPAD(SUBSTRING(cpf::text, 1, 3), 3, '0') || '.' ||
	   LPAD(SUBSTRING(cpf::text, 4, 3), 3, '0') || '.' ||
	   LPAD(SUBSTRING(cpf::text, 7, 3), 3, '0') || '-' ||
	   LPAD(SUBSTRING(cpf::text, 10, 2), 2, '0')
FROM
natural_person;
