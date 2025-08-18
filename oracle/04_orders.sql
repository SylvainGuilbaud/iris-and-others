-- Insertion des commandes
DECLARE
    v_product_pk NUMBER;
BEGIN
    FOR i IN 1..2000 LOOP
        SELECT pk INTO v_product_pk
        FROM (
            SELECT pk FROM C##supply.products
            ORDER BY DBMS_RANDOM.VALUE
        ) WHERE ROWNUM = 1;

        INSERT INTO C##supply.orders (product_id, quantity, order_date)
        VALUES (
            v_product_pk, -- Random product_id
            TRUNC(DBMS_RANDOM.VALUE(1, 1000)), -- Random quantity between 1 and 1000
            TO_DATE('2020-01-01', 'YYYY-MM-DD') + i - 1 -- Incremental dates starting from 2020-01-01
        );
    END LOOP;
END;
/

-- Activer l'affichage des résultats dans le log Oracle
SET SERVEROUTPUT ON;
-- Afficher le nombre de commandes insérées
DECLARE
    v_order_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_order_count
    FROM C##supply.orders;

    DBMS_OUTPUT.PUT_LINE('Nombre de commandes : ' || v_order_count);
END;
/

