-- Insertion des fournisseurs
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