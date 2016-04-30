ALTER TABLE `order` MODIFY id INTEGER AUTO_INCREMENT;
ALTER TABLE `order_history` MODIFY id INTEGER AUTO_INCREMENT;

ALTER TABLE `order_history` MODIFY active_from DATETIME;
ALTER TABLE `order_history` MODIFY active_to DATETIME;

INSERT INTO `status` VALUES (0, "new");
INSERT INTO `status` VALUES (1, "processing");
INSERT INTO `status` VALUES (2, "ready");

INSERT INTO `source` VALUES (0, "search");


INSERT INTO `client` VALUES (0, "vasya_pupkin", "Vasily", "Pupkin", 0);

INSERT INTO `order` (client_id, number, dt_created, dt_modified, sum, status_id) 
	VALUES (0, "cl_0_0", NOW(), NOW(), 195.23, 0);
UPDATE `order` SET status_id = 1 WHERE id = 1;
UPDATE `order` SET status_id = 2, sum = 212.35 WHERE id = 1;