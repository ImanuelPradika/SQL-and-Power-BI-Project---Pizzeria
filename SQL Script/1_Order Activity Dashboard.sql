SELECT 
	o.order_id, 
    i.item_price, 
    o.quantity, 
    i.item_category,
    i.item_name, 
    o.created_at, 
    o.created_date,  
    a.delivery_address1, 
    a.delivery_address2, 
    a.delivery_city,
    a.delivery_zipcode, 
    o.delivery
FROM Orders o
LEFT JOIN item i ON o.item_id = i.item_id
LEFT JOIN address a ON o.add_id = a.address_id;