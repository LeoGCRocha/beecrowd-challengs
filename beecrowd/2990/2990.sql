-- Step 1: Create the tables without foreign keys
CREATE TABLE departamentos (
    dnumero INTEGER PRIMARY KEY,
    dnome VARCHAR(60),
    cpf_gerente VARCHAR(15)
);

CREATE TABLE empregados (
    cpf VARCHAR(15) PRIMARY KEY,
    enome VARCHAR(60),
    salario FLOAT,
    cpf_supervisor VARCHAR(15),
    dnumero INTEGER
);

-- Add foreign key, solving circular dependecy
ALTER TABLE departamentos
ADD CONSTRAINT fk_gerente
FOREIGN KEY (cpf_gerente) REFERENCES empregados(cpf)

ALTER TABLE empregados
ADD CONSTRAINT fk_departamento
FOREIGN KEY (dnumero) REFERENCES departamentos(dnumero)

-- Other tables
CREATE TABLE projetos (
    pnumero INTEGER PRIMARY KEY,
    pnome VARCHAR(45),
    dnumero INTEGER,
    FOREIGN KEY (dnumero) REFERENCES departamentos(dnumero)
);

CREATE TABLE trabalha (
    cpf_emp VARCHAR(15),
    pnumero INTEGER,
    FOREIGN KEY (cpf_emp) REFERENCES empregados(cpf),
    FOREIGN KEY (pnumero) REFERENCES projetos(pnumero),
    PRIMARY KEY (cpf_emp, pnumero)
);

-- Insert data without considering fiels with relation
INSERT INTO empregados (cpf, enome, salario)
VALUES
    ('049382234322', 'João Silva', 2350),
    ('586733922290', 'Mario Silveira', 3500),
    ('2434332222', 'Aline Barros', 2350),
    ('1733332162', 'Tulio Vidal', 8350),
    ('4244435272', 'Juliana Rodrigues', 3310),
    ('1014332672', 'Natalia Marques', 2900);

-- Add departamento
INSERT INTO  departamentos(dnumero, dnome, cpf_gerente)
VALUES 
	('1010', 'Pesquisa', '049382234322'),
	('1020', 'Ensino', '2434332222')

-- Alter table to fix values does need fields with relation
SELECT * FROM empregados;

-- Add projetos
INSERT INTO projetos(pnumero, pnome, dnumero)
VALUES
	('2010', 'Aplha', '1010'),
	('2020', 'Beta', '1020')
	
INSERT INTO trabalha(cpf_emp,pnumero)
VALUES
	('049382234322', '2010'),
	('586733922290', '2020'),
	('049382234322', '2020')

-- bee2990
SELECT e.cpf, e.enome, d.dnome
FROM empregados e
LEFT JOIN trabalha t ON e.cpf = t.cpf_emp
LEFT JOIN projetos p ON p.pnumero = t.pnumero
LEFT JOIN departamentos d ON d.dnumero = e.dnumero
WHERE t.cpf_emp IS NULL
ORDER BY e.cpf;



