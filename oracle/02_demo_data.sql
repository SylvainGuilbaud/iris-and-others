

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

MERGE INTO C##supply.suppliers s
USING (SELECT 'Fournisseur A' AS name, 'info@fournisseura.fr' AS email, '0123456789' AS phone FROM dual UNION ALL
    SELECT 'Fournisseur B', 'info@fournisseurb.fr', '0223456789' FROM dual UNION ALL
    SELECT 'Fournisseur C', 'info@fournisseurc.fr', '0323456789' FROM dual UNION ALL
    SELECT 'Fournisseur D', 'info@fournisseurD.fr', '0423456789' FROM dual UNION ALL
    SELECT 'Fournisseur E', 'info@fournisseurE.fr', '0523456789' FROM dual UNION ALL
    SELECT 'Fournisseur F', 'info@fournisseurF.fr', '0623456789' FROM dual) src
ON (s.email = src.email)
WHEN NOT MATCHED THEN
    INSERT (name, email, phone)
    VALUES (src.name, src.email, src.phone);
