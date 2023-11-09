<h1 align="center">Social Network Insights Using Tableau and MySQL <a href="https://public.tableau.com/app/profile/mrankitgupta" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/mrankitgupta/mrankitgupta/a768d6bf0a001f03327578ae12f8867e4056cbaf/tableau-software.svg" alt="tableau" width="55" height="40"/> </a> </h1>

### About Project 👨‍💻

- Soicial Network insights - A Data Analysis project.

- Using MySQL RDB to extract the data from the database file.

- Development of a Tableau dashboard to perform analysis and produce quantitative visualizations to give valuable insights based on different parameters affecting the company's performance. 

## Entity Relationship Diagram

![image](https://github.com/robav112341/Social-Network-Data-Analysis/blob/main/Instagram%20SQL%20-%20Data%20Analysis%20Project/ERD.png)

## Technologies used 

* <a href="https://www.mysql.com/">MySQL</a><a href="https://www.mysql.com/" target="_blank"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="45" height="30"/> </a> 

* <a href="https://public.tableau.com/app/profile/mrankitgupta">Tableau</a><a href="https://public.tableau.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/mrankitgupta/mrankitgupta/a768d6bf0a001f03327578ae12f8867e4056cbaf/tableau-software.svg" alt="tableau" width="45" height="30"/> </a> 

## Setup Process
  
Step 1: Download file: <code>[Instagram SQL - Database & Inserting Data.sql](https://github.com/robav112341/Social-Network-Data-Analysis/blob/main/Instagram%20SQL%20-%20Data%20Analysis%20Project/DB/Instagram%20SQL%20-%20Database%20%26%20Inserting%20Data.sql.sql)</code>

Step 2: Open the file in MySQL, Extract data from the database using SQL.
  
Step 4: Connect Tableau with MySql database or Excel database.
  
Step 5: Develop dashboards which could be used to gain insights from sales data.

## Data Analysis Using Tableau

<p  align="center"><a href="https://public.tableau.com/views/SocialNetworkAnaylsis/Dashboard1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link"><img width="100%" src="https://raw.githubusercontent.com/robav112341/Social-Network-Data-Analysis/main/Instagram%20SQL%20-%20Data%20Analysis%20Project/Dashboard.png" /></a></p>

### Queries:

#### Users :

```sql
SELECT
*
FROM
users;
```

#### Likes by username :

```sql
SELECT 
    u.id,u.username, u.created_at, COUNT(*) as total_likes
FROM
    likes l
        JOIN
    users u ON l.user_id = u.id
GROUP BY 1
ORDER BY 2 DESC , 1 ASC;
```

#### Most followed :

```sql
SELECT 
    u.id,u.username, u.created_at, COUNT(*) AS total_followers
FROM
    follows f
        JOIN
    users u ON f.followee_id = u.id
GROUP BY 2
ORDER BY 4 DESC;
```

#### Users Activity :

```sql
SELECT 
    u.id,u.username, COUNT(*) AS total_activity
FROM
    photos p
        JOIN
    users u ON p.user_id = u.id
GROUP BY 1
ORDER BY 3 DESC;
```

#### Tags :

```sql
SELECT 
    p.user_id,t.tag_name
FROM
	photo_tags pt
JOIN 
	tags t on pt.tag_id = t.id
JOIN
	photos p on pt.photo_id = p.id
ORDER BY 2 DESC;
```

#### Sign Ups :

active :

```sql
SELECT 
    *
FROM
    users
WHERE
	id IN ( 
    SELECT 
		user_id
	FROM
		PHOTOS
	GROUP BY 1)
GROUP BY 1
ORDER BY 2 DESC;
```

non - active :

```sql
SELECT 
    *
FROM
    users
WHERE
	id NOT IN ( 
    SELECT 
		user_id
	FROM
		PHOTOS
	GROUP BY 1)
GROUP BY 1
ORDER BY 2 DESC;
```

#### Photos :

```sql
SELECT 
    *
FROM
    photos;
```


