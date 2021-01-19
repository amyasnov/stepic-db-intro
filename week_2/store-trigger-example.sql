DELIMITER //
CREATE TRIGGER on_update_sale
	AFTER UPDATE
	ON `sale` FOR EACH ROW
BEGIN
	CALL update_sale_history(NEW.id, NEW.status_id, NEW.sum);
END
//