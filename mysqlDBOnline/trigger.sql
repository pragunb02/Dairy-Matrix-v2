-- trigger not working in production in clever cloud

USE bvlvrpsfjxdh2per1gcz;

DROP TRIGGER IF EXISTS stores1_BEFORE_INSERT;
DROP TRIGGER IF EXISTS stores1_BEFORE_UPDATE;

DELIMITER //

CREATE TRIGGER stores1_BEFORE_INSERT BEFORE INSERT ON stores1
FOR EACH ROW
BEGIN
    IF NEW.stock < 0 THEN
        SET NEW.stock = 0;
    ELSEIF NEW.stock > 1000 THEN
        SET NEW.stock = 1000;
    END IF;
END//

CREATE TRIGGER stores1_BEFORE_UPDATE BEFORE UPDATE ON stores1
FOR EACH ROW
BEGIN
    IF NEW.stock < 0 THEN
        SET NEW.stock = 0;
    ELSEIF NEW.stock > 1000 THEN
        SET NEW.stock = 1000;
    END IF;
END//

DELIMITER ;