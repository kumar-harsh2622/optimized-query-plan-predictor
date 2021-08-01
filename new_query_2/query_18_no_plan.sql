
SELECT MIN(mi_idx.info) AS info,
       MIN(t.title) AS movie_title
FROM imdb.dbo.info_type AS it,
     imdb.dbo.keyword AS k,
     imdb.dbo.movie_info_idx AS mi_idx,
     imdb.dbo.movie_keyword AS mk,
     imdb.dbo.title AS t
WHERE it.info ='novel'
  AND k.keyword LIKE '%sequel%'
  AND mi_idx.info > '146.2'
  AND t.production_year > 1944
  AND t.id = mi_idx.movie_id
  AND t.id = mk.movie_id
  AND mk.movie_id = mi_idx.movie_id
  AND k.id = mk.keyword_id
  AND it.id = mi_idx.info_type_id
OPTION( MAXDOP 1)