ALTER TABLE `sale` MODIFY id INTEGER AUTO_INCREMENT;
ALTER TABLE `sale_history` MODIFY id INTEGER AUTO_INCREMENT;

ALTER TABLE `sale_history` MODIFY active_from DATETIME;
ALTER TABLE `sale_history` MODIFY active_to DATETIME;

INSERT INTO `status` VALUES (0, "new");
INSERT INTO `status` VALUES (1, "processing");
INSERT INTO `status` VALUES (2, "ready");

INSERT INTO `source` VALUES (0, "search");


INSERT INTO `client` VALUES (0, "vasya_pupkin", "Vasily", "Pupkin", 0);

INSERT INTO `sale` (client_id, number, dt_created, dt_modified, sale_sum, status_id) 
	VALUES (0, "cl_0_0", NOW(), NOW(), 195.23, 0);
UPDATE `sale` SET status_id = 1 WHERE id = 1;
UPDATE `sale` SET status_id = 2, sale_sum = 212.35 WHERE id = 1;