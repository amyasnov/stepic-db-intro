DROP PROCEDURE update_sale_history;
DELIMITER //
CREATE PROCEDURE update_sale_history (
	sale_id INTEGER,
	status_id INTEGER,
	sum DECIMAL(18,2)
)
BEGIN
	DECLARE now DATETIME;
	SET now = NOW();
	
	UPDATE sale_history 
		SET active_to = now 
	WHERE sale_history.sale_id = sale_id AND
		  active_to IS NULL	
	LIMIT 1;

	INSERT INTO sale_history 
			   (sale_id, status_id, sale_sum, active_from, active_to)	
		VALUES (sale_id, status_id, sale_sum, now, NULL);
END
//