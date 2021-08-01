
SELECT MIN(cn.name) AS producing_company,
       MIN(miidx.info) AS rating,
       MIN(t.title) AS movie
FROM imdb.dbo.company_name AS cn,
     imdb.dbo.company_type AS ct,
     imdb.dbo.info_type AS it,
     imdb.dbo.info_type AS it2,
     imdb.dbo.kind_type AS kt,
     imdb.dbo.movie_companies AS mc,
     imdb.dbo.movie_info AS mi,
     imdb.dbo.movie_info_idx AS miidx,
     imdb.dbo.title AS t
WHERE cn.country_code ='[ps]'
  AND ct.kind ='distributors'
  AND it.info ='rating'
  AND it2.info ='release dates'
  AND kt.kind ='tv series'
  AND mi.movie_id = t.id
  AND it2.id = mi.info_type_id
  AND kt.id = t.kind_id
  AND mc.movie_id = t.id
  AND cn.id = mc.company_id
  AND ct.id = mc.company_type_id
  AND miidx.movie_id = t.id
  AND it.id = miidx.info_type_id
  AND mi.movie_id = miidx.movie_id
  AND mi.movie_id = mc.movie_id
  AND miidx.movie_id = mc.movie_id
OPTION( MAXDOP 1)