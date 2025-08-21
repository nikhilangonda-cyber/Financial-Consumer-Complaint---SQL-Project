## **Financial Consumer Complaint-SQL-Project**
## **Project Overview**

**Project Title**: Financial Consumer Complaints

**Database**: Project-Consumer_Complaints

This project uses SQL to analyze financial consumer complaint data. The goal is to understand complaint patterns, the most affected products, service issues, and company responses. The project includes creating a database, cleaning the dataset, running SQL queries, and generating business insights. It’s an excellent project for learning SQL while applying it to real-world consumer rights and service quality analysis.

## **Objectives**

**1.Database Setup**: Create and set up a database to store consumer complaint data.

**2.Data Cleaning**: Remove or handle records with missing values.

**3.Exploratory Data Analysis (EDA)**: Explore complaint trends across states, products, and issues.

**4.Business Analysis**: Use SQL queries to evaluate company performance, timely responses, and dispute resolution.

## **Project Structure**
**1. Database Setup**

A table was created to store consumer complaint information, including details about submission channel, product, issue, company response, and timely resolution.

    CREATE TABLE consumer_complaints (
        Complaint_ID SERIAL PRIMARY KEY,
        Submitted_via VARCHAR(100),
        Date_submitted DATE,
        Date_received DATE,
        State VARCHAR(50),
        Product VARCHAR(100),
        Sub_product VARCHAR(100),
        Issue VARCHAR(255),
        Sub_issue VARCHAR(255),
        Company_public_response VARCHAR(255),
        Company_response_to_consumer VARCHAR(255),
        Timely_response VARCHAR(10)
    );

**2. Data Cleaning**

Complaints with missing critical fields were removed to ensure analysis quality.

    DELETE FROM consumer_complaints
    WHERE Submitted_via IS NULL 
       OR Date_submitted IS NULL 
       OR Date_received IS NULL 
       OR State IS NULL 
       OR Product IS NULL 
       OR Sub_product IS NULL 
       OR Issue IS NULL 
       OR Sub_issue IS NULL 
       OR Company_public_response IS NULL 
       OR Timely_response IS NULL;

**3. Data Analysis**

Q1. Retrieve the total number of complaints recorded.

    SELECT COUNT(*) AS total_complaints FROM consumer_complaints;


Q2. List the top 5 states with the highest number of complaints.

    SELECT state, COUNT(*) AS complaint_count
    FROM consumer_complaints
    GROUP BY state
    ORDER BY complaint_count DESC
    LIMIT 5;


Q3. Identify the most common product consumers complained about.

    SELECT product, COUNT(*) AS complaints
    FROM consumer_complaints
    GROUP BY product
    ORDER BY complaints DESC
    LIMIT 1;


Q4. Find the top 5 issues reported by consumers.

    SELECT issue, COUNT(*) AS num_of_issues
    FROM consumer_complaints
    GROUP BY issue
    ORDER BY num_of_issues DESC
    LIMIT 5;


Q5. Calculate the number of complaints submitted via each channel.

    SELECT submitted_via, COUNT(*) AS num_of_complaints
    FROM consumer_complaints
    GROUP BY submitted_via
    ORDER BY num_of_complaints DESC;


Q6. Determine how many complaints received a "Timely response."

    SELECT timely_response, COUNT(*) AS response_count
    FROM consumer_complaints
    GROUP BY timely_response
    ORDER BY response_count DESC;


Q7. Find the number of complaints by year.

    SELECT EXTRACT(YEAR FROM date_received) AS year, COUNT(*) AS total_complaints
    FROM consumer_complaints
    GROUP BY year
    ORDER BY year;


Q8. Identify sub-products that appear most frequently in complaints.

    SELECT sub_product, COUNT(*) AS complaints
    FROM consumer_complaints
    GROUP BY sub_product
    ORDER BY complaints DESC
    LIMIT 5;


Q9. Count how many complaints were resolved with "Closed with monetary relief."

    SELECT company_response_to_consumer, COUNT(*) AS response_count
    FROM consumer_complaints
    WHERE company_response_to_consumer = 'Closed with monetary relief'
    GROUP BY company_response_to_consumer;


Q10. Find the average number of complaints per company response type.

    SELECT ROUND(AVG(complaints),2) AS avg_complaints_per_response
    FROM (
        SELECT company_response_to_consumer, COUNT(*) AS complaints
        FROM consumer_complaints
        GROUP BY company_response_to_consumer
    ) ;

**Findings**

**1.State Trends:** A few states dominate in the number of complaints, highlighting possible regulatory focus areas.

**2.Product Insights:** Certain financial products, such as credit cards and loans, receive the most consumer complaints.

**3.Common Issues:** Billing disputes, loan servicing, and account errors are frequent pain points.

**4.Response Efficiency:** Many complaints are handled in a timely manner, but gaps exist in resolution quality.

**5.Relief Distribution:** "Closed with monetary relief" is relatively rare, suggesting most cases are resolved without financial compensation.

**Conclusion**

This project demonstrates how SQL can be applied to consumer protection and service quality analysis. Companies and regulators can use these insights to:

1.Reduce recurring product-related issues,

2.Monitor state-wise complaint trends,

3.Improve timely responses,

4.Ensure fair resolutions for consumers.
