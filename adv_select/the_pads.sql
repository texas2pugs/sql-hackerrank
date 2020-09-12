SELECT
  name + '(' + substring(Occupation,1,1)+ ')'
FROM OCCUPATIONS
ORDER BY name;
SELECT
  'There are a total of '+ cast(count(*) AS nvarchar) + ' ' + lower(Occupation) + 's.'
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY count(*),Occupation
