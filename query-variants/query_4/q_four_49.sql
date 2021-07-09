
  
SELECT MIN(an.name) AS cool_actor_pseudonym,
       MIN(t.title) AS series_named_after_char
FROM imdb.dbo.aka_name AS an,
     imdb.dbo.cast_info AS ci,
     imdb.dbo.company_name AS cn,
     imdb.dbo.keyword AS k,
     imdb.dbo.movie_companies AS mc,
     imdb.dbo.movie_keyword AS mk,
     imdb.dbo.name AS n,
     imdb.dbo.title AS t
WHERE cn.country_code ='[lk]'
  AND k.keyword ='character-name-in-title'
  AND t.episode_nr >= 665
  AND t.episode_nr < 70360
  AND an.person_id = n.id
  AND n.id = ci.person_id
  AND ci.movie_id = t.id
  AND t.id = mk.movie_id
  AND mk.keyword_id = k.id
  AND t.id = mc.movie_id
  AND mc.company_id = cn.id
  AND an.person_id = ci.person_id
  AND ci.movie_id = mc.movie_id
  AND ci.movie_id = mk.movie_id
  AND mc.movie_id = mk.movie_id;
