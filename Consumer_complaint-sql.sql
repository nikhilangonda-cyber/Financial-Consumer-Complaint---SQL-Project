-- Financial Consumer Complaint - SQL Project

CREATE TABLE consumer_complaints (
		Complaint_ID SERIAL PRIMARY KEY,
		Submitted_via VARCHAR (100),
		Date_submitted DATE,
		Date_received DATE ,
		State VARCHAR (50),
		Product VARCHAR (100),
		Sub_product	VARCHAR (100),
		Issue VARCHAR (255),
		Sub_issue VARCHAR (255),
		Company_public_response VARCHAR (255),	
		Company_response_to_consumer VARCHAR (255),
		Timely_response VARCHAR (10)
);																										    

SELECT * FROM consumer_complaints;

-- CLEANING THE DATA
DELETE FROM consumer_complaints
WHERE Submitted_via IS NULL OR
      Date_submitted IS NULL OR
      Date_received  IS NULL OR
      State IS NULL OR
      Product IS NULL OR
      Sub_product IS NULL OR
      Issue IS NULL OR 
	  Sub_issue IS NULL OR 
	  Company_public_response IS NULL OR
      Timely_response IS NULL 
RETURNING Submitted_via , Date_submitted , Date_received  , State , Product, Sub_product, Issue ,Sub_issue, Company_public_response ,Timely_response ;


---- Analysis Questions

-- Q1.Retrieve the total number of complaints recorded in the dataset.
-- Q2.List the top 5 states with the highest number of complaints.
-- Q3.Identify the most common product consumers complained about.
-- Q4.Find the top 5 issues reported by consumers.
-- Q5.Calculate the number of complaints submitted via each channel (Web, Referral, Phone, etc.).
-- Q6.Determine how many complaints received a "Timely response."
-- Q7.Find the number of complaints by year, based on Date received.
-- Q8.Identify sub-products that appear most frequently in complaints.
-- Q9.Count how many complaints were resolved with "Closed with monetary relief.
-- Q10.Find the average number of complaints per company response type.


Q1.Retrieve the total number of complaints recorded in the dataset.

SELECT COUNT (*) AS total_complaint FROM consumer_complaints;

Q2.List the top 5 states with the highest number of complaints.

SELECT state, COUNT(*) AS complaint_count FROM consumer_complaints
GROUP BY state 
ORDER BY complaint_count DESC 
LIMIT 5;

Q3.Identify the most common product consumers complained about.

SELECT product , COUNT(*)AS complaints FROM consumer_complaints
GROUP BY product
ORDER BY complaints DESC
LIMIT 1;

Q4.Find the top 5 issues reported by consumers.

SELECT issue , COUNT (*) AS num_of_issues  FROM consumer_complaints
GROUP BY issue
ORDER BY num_of_issues DESC
LIMIT 5;

Q5.Calculate the number of complaints submitted via each channel (Web, Referral, Phone, etc.).

SELECT submitted_via, COUNT (*) AS num_of_complaints FROM consumer_complaints
GROUP BY submitted_via 
ORDER BY num_of_complaints DESC;

Q6.Determine how many complaints received a "Timely response."

SELECT timely_response ,COUNT (*) AS response_count FROM consumer_complaints
GROUP BY timely_response
ORDER BY response_count DESC;

Q7.Find the number of complaints by year, based on Date received.

SELECT EXTRACT (YEAR from date_received) as Year ,COUNT (*) AS total_complaint FROM consumer_complaints
GROUP BY Year 
ORDER BY Year ;

Q8.Identify sub-products that appear most frequently in complaints.

SELECT sub_product, COUNT (*) AS complaints FROM consumer_complaints
GROUP BY sub_product
ORDER BY complaints DESC
LIMIT 5;

Q9.Count how many complaints were resolved with "Closed with monetary relief".

SELECT company_response_to_consumer, COUNT(*) AS response_count
FROM consumer_complaints
WHERE company_response_to_consumer = 'Closed with monetary relief'
GROUP BY company_response_to_consumer ;

Q10.Find the average number of complaints per company response type.

SELECT company_response_to_consumer, ROUND(AVG(COUNT(*))over(),2) AS avg_response FROM Consumer_complaints
GROUP BY company_response_to_consumer







