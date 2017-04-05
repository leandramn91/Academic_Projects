

DROP TRIGGER  CheckUpdateRankAfterReview;
DELIMITER $$
CREATE TRIGGER  CheckUpdateRankAfterReview AFTER INSERT ON reviewstable

FOR EACH ROW
BEGIN		
    DECLARE id INT; 
    DECLARE rank_id INT;
    DECLARE calc_rank INT;
    
    SELECT UserID FROM reviewstable 
    WHERE reviewstable.UserID = NEW.UserID AND 
    reviewstable.ProductID = NEW.ProductID AND
    reviewstable.ReviewID = NEW.ReviewID INTO id;   
    CALL GetRankOfUser(id, @rank);
    SELECT ranktable.id FROM ranktable WHERE ranktable.Rank = @rank INTO calc_rank;
    SELECT usertable.RankID FROM usertable where UserID = id INTO rank_id;
	
    IF calc_rank <> rank_id THEN
			UPDATE usertable SET RankID = calc_rank WHERE UserID = id;
	END IF;
    END$$

DELIMITER ;


DELIMITER $$
CREATE TRIGGER  CheckUpdateRankAfterUpdateReview AFTER UPDATE ON reviewstable

FOR EACH ROW
BEGIN		
    DECLARE id INT; 
    DECLARE rank_id INT;
    DECLARE calc_rank INT;
    
    SELECT UserID FROM reviewstable 
    WHERE reviewstable.UserID = NEW.UserID AND 
    reviewstable.ProductID = NEW.ProductID AND
    reviewstable.ReviewID = NEW.ReviewID INTO id;   
    CALL GetRankOfUser(id, @rank);
    SELECT ranktable.id FROM ranktable WHERE ranktable.Rank = @rank INTO calc_rank;
    SELECT usertable.RankID FROM usertable where UserID = id INTO rank_id;
	
    IF calc_rank <> rank_id THEN
			UPDATE usertable SET RankID = calc_rank WHERE UserID = id;
	END IF;
    END$$

DELIMITER ;


DROP TRIGGER CreateView_MavenUsers_Having_Same_Product;
DELIMITER $$
CREATE TRIGGER  Insertinto_MavenUsers_Having_Same_Product AFTER INSERT ON possessiontable

FOR EACH ROW
BEGIN	 
DECLARE done INT DEFAULT FALSE;
DECLARE id_user INT;
DECLARE id_product INT;
DECLARE id_rank INT;
DECLARE id_temp INT;

Declare  c_iterator CURSOR FOR
		Select UserID, ProductID from possessiontable WHERE ProductID = NEW.ProductID;


DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN c_iterator;
Delete FROM MavenUserTable;
read_loop: LOOP
	FETCH c_iterator INTO id_user, id_product;

	IF done THEN
		  LEAVE read_loop;
	END IF;
	SELECT RankID FROM usertable WHERE UserID = id_user into id_rank;
    
	IF id_rank = 1 THEN
		SELECT userID FROM MavenUserTable into id_temp;
        IF id_temp <> id_user THEN
			INSERT INTO MavenUserTable (SELECT UserID, Username, Rank FROM usertable INNER JOIN ranktable ON usertable.RankID = ranktable.id 
			WHERE usertable.UserID = id_user AND ranktable.id = id_rank);
		END IF; 
	END IF;
	END LOOP;
	CLOSE c_iterator;
END$$
DELIMITER ;

