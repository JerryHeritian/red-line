-- ============================================
-- PROJECT RED LINE — Phase 2 SQL
-- Dataset : Airbnb Montreal (Inside Airbnb)
-- Tables  : listings × reviews
-- ============================================

-- Requête 1 : Prix moyen par quartier
SELECT 
    neighbourhood AS Quartier,
    ROUND(AVG(price) ,2) AS Prix_moyen,
	COUNT(id) AS Nombre_logement
FROM listings
GROUP BY Quartier
ORDER BY Prix_moyen DESC;

-- Requête 2 : Top 10 quartiers par nb logements
SELECT
	neighbourhood as Quartier,
	COUNT(name) as Nombre_logement
FROM listings
GROUP BY Quartier
ORDER BY Nombre_logement DESC
LIMIT 10;

-- Requête 3 : Top 20 logements avec le plus d'avis
SELECT
	name as Logement,
	neighbourhood as Quartier,
	number_of_reviews_ltm as Avis
FROM listings
ORDER BY Avis DESC
LIMIT 20;

-- Requête 4 : JOIN listings × reviews — nb avis réels par quartier
SELECT
	l.neighbourhood AS Quartier,
	COUNT(r.listing_id) as Nombre_de_revue,
	r.date AS Date_revue
FROM listings l
JOIN reviews r ON r.listing_id = l.id
GROUP BY Quartier
ORDER BY Nombre_de_revue DESC

-- Requête 5 : Ratio prix / nb avis par quartier
SELECT
	neighbourhood AS Quartier,
	ROUND(AVG(price), 2) AS Prix,
	ROUND(AVG(number_of_reviews), 2) AS Revue,
	ROUND(AVG(number_of_reviews) / AVG(price), 2 ) AS Ratio
FROM  listings
GROUP BY Quartier
ORDER BY Ratio DESC
LIMIT 10;