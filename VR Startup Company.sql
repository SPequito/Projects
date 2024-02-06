SELECT *
FROM employees
LIMIT 5 ;

SELECT *
FROM projects 
LIMIT 5 ;

SELECT first_name, last_name
FROM employees
WHERE current_project IS NULL;

SELECT project_name 
FROM projects
WHERE project_id NOT IN (
   SELECT current_project
   FROM employees
   WHERE current_project IS NOT NULL);

/*my way to do */
SELECT  MAX(current_project), project_name
FROM  employees
JOIN projects
ON projects.project_id = employees.current_project;

/*solucion*/
SELECT project_name
FROM projects
INNER JOIN employees 
  ON projects.project_id = employees.current_project
WHERE current_project IS NOT NULL
GROUP BY project_name
ORDER BY COUNT(employee_id) DESC
LIMIT 1;

SELECT project_name
FROM projects
INNER JOIN employees 
  ON projects.project_id = employees.current_project
WHERE current_project IS NOT NULL
GROUP BY current_project
HAVING COUNT(current_project) > 1;

SELECT (COUNT(*) * 2) - (
  SELECT COUNT(*)
  FROM employees
  WHERE current_project IS NOT NULL
    AND position = 'Developer') AS 'Count'
FROM projects;

SELECT personality 
FROM employees
GROUP BY personality
ORDER BY COUNT(personality) DESC
LIMIT 1;

SELECT project_name
FROM projects
INNER JOIN employees 
  ON projects.project_id = employees.current_project
WHERE personality = (SELECT personality 
FROM employees
WHERE current_project IS NOT NULL
GROUP BY personality
ORDER BY COUNT(personality) DESC
LIMIT 1);

SELECT first_name, last_name,personality,  project_name
FROM projects
INNER JOIN employees 
  ON projects.project_id = employees.current_project
WHERE personality = (SELECT personality 
FROM employees
WHERE current_project IS NOT NULL
GROUP BY personality
ORDER BY COUNT(personality) DESC
LIMIT 1);

SELECT last_name, first_name, personality, project_name,
CASE 
   WHEN personality = 'INFP' OR personality = 'ENFP' OR personality = 'INFJ'
   THEN (SELECT COUNT(*)
      FROM employees 
      WHERE personality IN ('ISFP', 'ESFP', 'ISTP', 'ESTP', 'ISFJ', 'ESFJ', 'ISTJ', 'ESTJ'))
   WHEN personality = 'ISFP' 
   THEN (SELECT COUNT(*)
      FROM employees 
      WHERE personality IN ('INFP', 'ENTP', 'INFJ'))
  
   ELSE 0
END AS 'IMCOMPATS'
FROM employees
LEFT JOIN projects on employees.current_project = projects.project_id;

