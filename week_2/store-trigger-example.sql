DELIMITER //
CREATE TRIGGER on_update_order
	AFTER UPDATE
	ON `order` FOR EACH ROW
BEGIN
	CALL update_order_history(NEW.id, NEW.status_id, NEW.sum);
END
//