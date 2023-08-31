SELECT e.cpf, e.enome, d.dnome
FROM empregados e
LEFT JOIN trabalha t ON e.cpf = t.cpf_emp
LEFT JOIN projetos p ON p.pnumero = t.pnumero
LEFT JOIN departamentos d ON d.dnumero = e.dnumero
WHERE t.cpf_emp IS NULL
ORDER BY e.cpf;