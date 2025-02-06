//Request 1
    ALTER TABLE employee
    ADD nationality varchar(255);
// Insert database employee
    INSERT INTO employee ( company_id, staff_id, full_name, date_of_birth, gender, phone_number, email, nationality)
    VALUES ('4', 'EMP084', 'Lim Sopheak', '03,02,2006', 'Male', '078781285', 'sopheak@gmail.com', 'khmer');

// UPDATE
UPDATE employee
SET nationality = 'Khmer'
WHERE id BETWEEN 1 AND 83;

//Request 2

SELECT em.full_name, em.gender, em.date_of_birth, c.company_name, c.contact_email, c.phone_number,
    CASE
        WHEN AGE(em.date_of_birth) < INTERVAL '18 years' THEN 'Under Age'
        WHEN AGE(em.date_of_birth) > INTERVAL '60 years' THEN 'Over Age'
        ELSE 'Within Age Range'
    END AS age_group
FROM employee em
JOIN company c ON em.company_id = c.id;


//Request 3
INSERT INTO company ( company_name, contact_email, phone_number, address, industry_type, license_number)
VALUES ( '东方科技有限公司 (Dongfang Technology Co., Ltd.)', 'info@dongfangtech.com', '+86 10 1234 5678', '北京市朝阳区科技路10号 (10 Keji Road, Chaoyang District, Beijing)', 'Technology', 'CN12345678');

INSERT INTO quotation ( company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date)
VALUES ( 6, 3, '2025-01-03', 300.00, 10000.00, 'Personal Accident Coverage (Accident, Disability, Death)', 'Pending', NULL);


INSERT INTO employee ( company_id, staff_id, full_name, date_of_birth, gender, phone_number, email, nationality)
VALUES ('6', 'EMP086', '王伟 (Wang Wei)', '1985-03-15', 'Male', '+86 13912345678', ' wang.wei@dongfangtech.com', 'chinese'),
('6', 'EMP087', '李娜 (Li Na)', '1990-07-10', 'Female', '+86 139 2345 6789', 'li.na@dongfangtech.com', 'chinese'),
('6', 'EMP088', '张强 (Zhang Qiang)', '1992-09-30', 'Male', '+86 139 3456 7890', 'zhang.qiang@dongfangtech.com', 'chinese'),
('6', 'EMP089', '刘洋 (Liu Yang)', '1988-11-25', 'Female', '+86 139 4567 8901', 'liu.yang@dongfangtech.com', 'chinese'),
('6', 'EMP090', '陈刚 (Chen Gang)', '1987-05-12', 'Male', '+86 139 5678 9012', 'chen.gang@dongfangtech.com', 'chinese')

SELECT id, company_name, contact_email, phone_number, address, industry_type, license_number
    FROM public.company WHERE id=6;

SELECT id, company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date
    FROM public.quotation WHERE id=7;

SELECT id, company_id, staff_id, full_name, date_of_birth, gender, phone_number, email, nationality
    FROM public.employee WHERE company_id=6;

// Request 4

ALTER TABLE insured_coverage
DROP COLUMN date_of_birth;

// Request 6
INSERT INTO health_facility (health_facility_name, is_partner_hf, phone_number, location, email )
VALUES ('Preah Ang Duong Hospital',true , '+855 23 218 875', 'No. 118, Preah Norodom Blvd (41), corner of Kramuon Sar (St. 114), 12203 Phnom Penh', null  ),
('Chamkar Morn Referral Hospital',true , '+855 11 811 132', 'Preah Norodom Blvd (41), corner of Rue Oknha Chrun Youhak (St. 294), 12302 Phnom Penh', null  ),
('Teuk Thla Health Center', true, '+855 12 927 052', 'Confederation de la Russie Blvd (110), 12102 Phnom Penh', null );
// Partner soon
INSERT INTO health_facility (health_facility_name, is_partner_hf, phone_number, location, email )
VALUES ('Chamkar Dong Health Center',false , '+855 12 551 254', 'Chamkar Dong (St. 217), Khva Village, 12401 Phnom Penh', null  ),
('Prek Phneou Health Center', false, '+855 23 218 875', 'No. 118, Preah Norodom Blvd (41), corner of Kramuon Sar (St. 114), 12203 Phnom Penh', null );

// Request 7 
 ALTER TABLE health_facility
ALTER COLUMN phone_number TYPE VARCHAR(200); 



// Request 5

SELECT COUNT(*)
FROM insurance_policy;

SELECT SUM(proposed_premium)
FROM quotation;

SELECT COUNT(*)
FROM insurance_policy;


SELECT
    COUNT(i.policy_name) AS total_policy,
    SUM(q.proposed_premium) AS total_propose_premium
FROM
    quotation q
    JOIN insurance_policy i ON i.quotation_id = q.id;


SELECT
    COUNT(i.insurance_policy_id) AS total_insured,
    SUM(c.coverage_amount) AS total_policy
  
FROM insured_coverage i 
JOIN insurance_policy c ON i.insurance_policy_id = i.id;
JOIN insurance_policy_benefit ON i.insurance_policy_id=id


SELECT
COUNT(DISTINCT e.id) AS total_prospect,
COUNT(DISTINCT c.id) AS total_prospect_company
FROM employee e
JOIN company c ON e.company_id = c.id;