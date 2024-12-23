
--objectives

--Query to provide a comprehensive list of all Netflix shows and movies
      SELECT title, type
      FROM netflix_content

--Query to analyze trends in release years and genres
   SELECT release_year, genre, COUNT(*) as title_count
   FROM netflix_content
   GROUP BY release_year, genre

--Query to provide personalized viewing experience for users
 SELECT title, genre, rating
FROM netflix_content
WHERE genre IN (
SELECT genre
FROM user_preferences
WHERE user_id = <user_id>
) AND title NOT IN (
SELECT title
FROM user_history
WHERE user_id = <user_id>
) AND rating >= (
SELECT AVG(rating)
FROM user_ratings
WHERE user_id = <user_id>
)
ORDER BY rating DESC
LIMIT 10



--Query to facilitate content licensing negotiations
SELECT 
  title, 
  genre, 
  release_year, 
  AVG(rating) as average_rating, 
  COUNT(user_ratings.id) as rating_count, 
  COUNT(user_history.id) as watch_count
FROM 
  netflix_content 
  LEFT JOIN user_ratings ON netflix_content.id = user_ratings.content_id 
  LEFT JOIN user_history ON netflix_content.id = user_history.content_id
GROUP BY 
  title, 
  genre, 
  release_year
ORDER BY 
  watch_count DESC, 
  rating_count DESC, 
  average_rating DESC
LIMIT 100








--Query to improve content recommendations and user engagement
SELECT 
  netflix_content.title, 
  netflix_content.genre, 
  netflix_content.release_year, 
  AVG(user_ratings.rating) as average_rating, 
  COUNT(user_ratings.id) as rating_count, 
  COUNT(user_history.id) as watch_count, 
  SUM(CASE WHEN user_history.is_continue_watching = 1 THEN 1 ELSE 0 END) as continue_watching_count
FROM 
  netflix_content 
  LEFT JOIN user_ratings ON netflix_content.id = user_ratings.content_id 
  LEFT JOIN user_history ON netflix_content.id = user_history.content_id
WHERE 
  user_history.user_id = <user_id>
GROUP BY 
  netflix_content.title, 
  netflix_content.genre, 
  netflix_content.release_year
ORDER BY 
  continue_watching_count DESC, 
  watch_count DESC, 
  rating_count DESC, 
  average_rating DESC
LIMIT 10

 
   
