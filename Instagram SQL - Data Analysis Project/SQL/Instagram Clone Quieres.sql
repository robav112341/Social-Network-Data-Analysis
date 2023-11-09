-- Users
SELECT
*
FROM
users;

-- likes by username
SELECT 
    u.id,u.username, u.created_at, COUNT(*) as total_likes
FROM
    likes l
        JOIN
    users u ON l.user_id = u.id
GROUP BY 1
ORDER BY 2 DESC , 1 ASC;

-- most followed
SELECT 
    u.id,u.username, u.created_at, COUNT(*) AS total_followers
FROM
    follows f
        JOIN
    users u ON f.followee_id = u.id
GROUP BY 2
ORDER BY 4 DESC;

-- most liked photo:
SELECT 
    user_id,photo_id, COUNT(*) total_likes
FROM
    likes
GROUP BY 2
ORDER BY 3 DESC;


-- users activity 
SELECT 
    u.id,u.username, COUNT(*) AS total_activity
FROM
    photos p
        JOIN
    users u ON p.user_id = u.id
GROUP BY 1
ORDER BY 3 DESC;

-- tags breakdown
SELECT 
    p.user_id,t.tag_name
FROM
	photo_tags pt
JOIN 
	tags t on pt.tag_id = t.id
JOIN
	photos p on pt.photo_id = p.id
ORDER BY 2 DESC;

-- register by day
-- active
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

-- No active
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

-- number of active (added photos) users:
SELECT 
    COUNT(DISTINCT user_id) AS count_actives
FROM
    PHOTOS;
    
-- Photo Count
SELECT 
    *
FROM
    photos;
