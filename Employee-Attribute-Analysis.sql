SELECT * FROM human_resource.`employee attrition`;

-- Question 1. How many Employees in the Company
SELECT 
	COUNT(*) 
FROM human_resource.`employee attrition`;

-- Question 2. How many departments are available
SELECT 
	DISTINCT(dept)
FROM human_resource.`employee attrition`;

-- Question 3. What is the Average number of project per department
SELECT 
	dept,
	ROUND(AVG(number_project), 2) AS avg_project
FROM human_resource.`employee attrition`
GROUP BY dept
ORDER BY avg_project DESC;


-- Question 4. What are the Top 2 departments with the Lowest and Highest satisfaction scores

-- Lowest satisfaction_score
SELECT 
	dept, 
	ROUND(AVG(satisfaction_level), 2) as satisfaction_score
FROM human_resource.`employee attrition`
GROUP BY dept
ORDER BY satisfaction_score
LIMIT 2;

-- Highest satisfaction_score
SELECT 
	dept, 
	ROUND(AVG(satisfaction_level), 2) as satisfaction_score
FROM human_resource.`employee attrition`
GROUP BY dept
ORDER BY satisfaction_score DESC
LIMIT 2;


-- Question 5. How many salary categories are available
SELECT 
	DISTINCT(salary)
FROM human_resource.`employee attrition`;


-- Question 6. What is the relationship between the salary and satisfaction score?
SELECT 
	salary,
    ROUND(AVG(satisfaction_level), 2) AS avg_satisfaction_level
FROM human_resource.`employee attrition`
GROUP BY salary
ORDER BY avg_satisfaction_level;

-- Question 7. How did the top and bottom two depatments perform in the following areas:
-- Where the top 2 are : support and management
-- Where the bottom 2 are : hr and accounting

-- a. Last Evaluation
SELECT 	
        CASE
			WHEN dept in ('support', 'management') THEN 'top_dept'
            WHEN dept in ('hr', 'accounting') THEN 'bottom_dept'
		END AS top_bottom_dept,
        ROUND(AVG(last_evaluation), 2) AS avg_last_evaluation
FROM human_resource.`employee attrition`
WHERE dept IN ('support', 'management', 'hr', 'accounting')
GROUP BY top_bottom_dept;

-- b. Number of Project
SELECT 	
        CASE
			WHEN dept in ('support', 'management') THEN 'top_dept'
            WHEN dept in ('hr', 'accounting') THEN 'bottom_dept'
		END AS top_bottom_dept,
        ROUND(AVG(last_evaluation), 2) AS avg_last_evaluation,
		ROUND(AVG(number_project), 2) AS avg_number_projects
FROM human_resource.`employee attrition`
WHERE dept IN ('support', 'management', 'hr', 'accounting')
GROUP BY top_bottom_dept;


-- c. Average Monthly hours
SELECT 	
        CASE
			WHEN dept in ('support', 'management') THEN 'top_dept'
            WHEN dept in ('hr', 'accounting') THEN 'bottom_dept'
		END AS top_bottom_dept,
        ROUND(AVG(last_evaluation), 2) AS avg_last_evaluation,
		ROUND(AVG(number_project), 2) AS avg_number_projects,
        ROUND(AVG(average_montly_hours), 2) AS avg_monthly_hours
FROM human_resource.`employee attrition`
WHERE dept IN ('support', 'management', 'hr', 'accounting')
GROUP BY top_bottom_dept;


-- d. Time spent in the company
SELECT 	
        CASE
			WHEN dept in ('support', 'management') THEN 'top_dept'
            WHEN dept in ('hr', 'accounting') THEN 'bottom_dept'
		END AS top_bottom_dept,
        ROUND(AVG(last_evaluation), 2) AS avg_last_evaluation,
		ROUND(AVG(number_project), 2) AS avg_number_projects,
        ROUND(AVG(average_montly_hours), 2) AS monthly_hours,
        ROUND(AVG(time_spend_company), 2) AS time_at_company
FROM human_resource.`employee attrition`
WHERE dept IN ('support', 'management', 'hr', 'accounting')
GROUP BY top_bottom_dept;

-- e. Work accident
SELECT 	
        CASE
			WHEN dept in ('support', 'management') THEN 'top_dept'
            WHEN dept in ('hr', 'accounting') THEN 'bottom_dept'
		END AS top_bottom_dept,
        ROUND(AVG(last_evaluation), 2) AS avg_last_evaluation,
		ROUND(AVG(number_project), 2) AS avg_number_projects,
        ROUND(AVG(average_montly_hours), 2) AS monthly_hours,
        ROUND(AVG(time_spend_company), 2) AS time_at_company,
		ROUND(AVG(Work_accident), 2) AS avg_number_accidents
FROM human_resource.`employee attrition`
WHERE dept IN ('support', 'management', 'hr', 'accounting')
GROUP BY top_bottom_dept;

-- f. Promotion last 5years
SELECT 	
        CASE
			WHEN dept in ('support', 'management') THEN 'top_dept'
            WHEN dept in ('hr', 'accounting') THEN 'bottom_dept'
		END AS top_bottom_dept,
        ROUND(AVG(last_evaluation), 2) AS avg_last_evaluation,
		ROUND(AVG(number_project), 2) AS avg_number_projects,
        ROUND(AVG(average_montly_hours), 2) AS monthly_hours,
        ROUND(AVG(time_spend_company), 2) AS time_at_company,
		ROUND(AVG(time_spend_company), 2) AS time_at_company,
		ROUND(AVG(Work_accident), 2) AS avg_number_accidents,
		ROUND(AVG(promotion_last_5years), 2) AS avg_number_promotion

FROM human_resource.`employee attrition`
WHERE dept IN ('support', 'management', 'hr', 'accounting')
GROUP BY top_bottom_dept;
