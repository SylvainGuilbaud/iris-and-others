-- Insertion des produits
MERGE INTO C##supply.products p
USING (SELECT 'Palette Europe' AS name, 'PAL-EUR' AS sku, 25.00 AS price FROM dual UNION ALL
    SELECT 'Carton 60x40', 'CRT-6040', 2.50 FROM dual UNION ALL
    SELECT 'Film plastique', 'FILM-STD', 1.20 FROM dual UNION ALL
    SELECT 'Stretch film', 'FILM-STR', 1.50 FROM dual UNION ALL
    SELECT 'Film bulle', 'FILM-BUL', 1.80 FROM dual UNION ALL
    SELECT 'Film etirable', 'FILM-ETR', 1.60 FROM dual UNION ALL
    SELECT 'Film retractable', 'FILM-RET', 1.90 FROM dual UNION ALL
    SELECT 'Film de protection', 'FILM-PRO', 2.00 FROM dual UNION ALL
    SELECT 'Film adhesif', 'FILM-ADH', 2.10 FROM dual UNION ALL
    SELECT 'Film de masquage', 'FILM-MAS', 2.20 FROM dual UNION ALL
    SELECT 'Film de demenagement', 'FILM-DEM', 2.30 FROM dual UNION ALL
    SELECT 'Carton de demenagement', 'CRT-DEM', 2.40 FROM dual UNION ALL
    SELECT 'Palette de demenagement', 'PAL-DEM', 2.50 FROM dual UNION ALL
    SELECT 'Palette Asie', 'PAL-ASIE', 2.60 FROM dual) src
ON (p.sku = src.sku)
WHEN NOT MATCHED THEN
    INSERT (name, sku, price)
    VALUES (src.name, src.sku, src.price);
