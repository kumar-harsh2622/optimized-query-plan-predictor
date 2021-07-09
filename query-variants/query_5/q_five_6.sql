
SELECT MIN(t.title) AS movie_title
FROM imdb.dbo.company_name AS cn,
     imdb.dbo.keyword AS k,
     imdb.dbo.movie_companies AS mc,
     imdb.dbo.movie_keyword AS mk,
     imdb.dbo.title AS t
WHERE cn.country_code ='[ps]'
  AND k.keyword ='middle-ages'
  AND cn.id = mc.company_id
  AND mc.movie_id = t.id
  AND t.id = mk.movie_id
  AND mk.keyword_id = k.id
  AND mc.movie_id = mk.movie_id;
