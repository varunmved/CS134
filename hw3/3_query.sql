--	query 1
SELECT 	p.loan_no, p.payment_no, p.amount, p.method 
FROM 	Payment AS p 
WHERE 	p.status = 'Paid' AND p.amount < 15;
--	query 2
SELECT 	DISTINCT c.ssn, c.fname, c.lname 
FROM 	Customer AS c, Account AS a, Owns AS o 
WHERE 	c.ssn = o.ssn AND o.acc_no = a.acc_no AND a.balance > 10000;
--	query 3
SELECT 	c.ssn, c.fname, c.lname 
FROM 	Customer AS c
WHERE 	(SELECT COUNT(*) FROM Owns AS o WHERE c.ssn = o.ssn) < 3;
--	query 4
SELECT 	c.ssn, c.fname, c.lname, c.phone 
FROM 	Customer AS c, Owns AS o 
WHERE 	c.ssn = o.ssn AND o.acc_no = '000000001';
--	query 5
SELECT 	p.payment_no, p.due_date 
FROM 	Customer AS c, Borrows AS b, Loan AS l, Payment AS p 
WHERE 	c.fname = 'John' AND c.lname = 'Smith' AND c.ssn = b.ssn AND b.loan_no = l.loan_no AND l.loan_no = p.loan_no AND p.method = 'Check';
--	query 6
SELECT 	DISTINCT c.ssn, c.fname, c.lname 
FROM 	Customer AS c, Borrows AS b 
WHERE 	c.ssn = b.ssn;
--	query 7
SELECT 	c.ssn, COUNT(*) AS smith_loans 
FROM 	Customer AS c, Borrows AS b 
WHERE 	c.fname = 'John' AND c.lname = 'Smith' AND c.ssn = b.ssn;
--	query 8
SELECT 		c.ssn, count(*) AS number_of_accounts, sum(a.balance) AS total_balance 
FROM 		Customer AS c, Account AS a, Owns AS o 
WHERE 		c.ssn = o.ssn AND o.acc_no = a.acc_no AND o.ssn IN (SELECT o.ssn FROM Owns AS o GROUP BY o.ssn HAVING COUNT(*) > 2) 
GROUP BY 	c.ssn;
--1.


