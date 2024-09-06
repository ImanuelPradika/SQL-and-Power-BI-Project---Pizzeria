SELECT
	s2.ing_name, 
    s2.ordered_weight,
    ing.ing_weight * inv.quantity as total_inv_weight,
    (ing.ing_weight * inv.quantity) - s2.ordered_weight as remaining_weight
 from
( SELECT
	ing_id,
	ing_name,
    SUM(ordered_weight) AS ordered_weight
FROM
	Stock1
    GROUP BY ing_name,ing_id ) s2
LEFT JOIN Inventory inv ON inv.item_id = s2.ing_id
LEFT JOIN ingredients ing ON ing.ing_id = s2.ing_id;