
call CalculateAge(4);
call CalculateAge(5);
call CalculateAge(6);

call CalculateAge(7);
call CalculateAge(8);
call CalculateAge(9);

call CalculateAge(10);
call CalculateAge(11);
call CalculateAge(12);

call CalculateAge(13);
call CalculateAge(14);
call CalculateAge(15);

call CalculateAge(16);

call CalculateAge(17);
call CalculateAge(18);

call CalculateBMI(1);
call CalculateBMI(2);
call CalculateBMI(3);
call CalculateBMI(4);
call CalculateBMI(5);
call CalculateBMI(6);
call CalculateBMI(7);
call CalculateBMI(8);
call CalculateBMI(9);
call CalculateBMI(10);
call CalculateBMI(11);
select * from athlete_table;
delete from athlete_table;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateBMI`(in ID int)
Begin
declare BMI double;
declare height int;
declare weight double;
select AthleteHeight, AthleteWeight from athlete_table where AthleteID = ID into height,weight;
set BMI = (weight * 4500)/(height * height);
select BMI;
update athlete_table set AthleteBMI = BMI where AthleteID = ID;
END$$
DELIMITER ;

select AthleteHeight, AthleteWeight from athlete_table where AthleteID = 5;

select * from athlete_table;

select * from user_table;

desc athlete_table;

select * from activity_table;

call CalculateCaloriesBurnt(1,12,5,1);

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `Cube`(num double) RETURNS double
BEGIN
Declare  result double;
SET result = num * num * num;
RETURN result;
END$$

DELIMITER ;

DELIMITER $$
DECLARE var int;
call GetMaxHR(35, @var);
select @var;
DELIMITER ;


DROP TRIGGER healthmonitoring.Alert_After_HeartRate_Update;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxHR`(in age int, out returnMaxHR int) 
BEGIN
DECLARE done INT DEFAULT FALSE;
Declare MaxHR int;
Declare MinAge int;
Declare MaxAge int;

Declare  c_iterator CURSOR for
      SELECT ShrMaxHR, ShrAgeMin, ShrAgeMax from safeheartrate_table;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN c_iterator;

read_loop: LOOP
 FETCH c_iterator INTO MaxHR, MinAge, MaxAge;
	
 IF done THEN
      LEAVE read_loop;
 END IF;
 
 IF age >= MinAge AND age <= MaxAge THEN
	SET returnMaxHR = MaxHR;      
  END IF;
END LOOP;
CLOSE c_iterator;
END$$

DELIMITER ;


insert into user_table values(default,'Tejas', '50 Global St', 'Washington', '2567', '98547542231', '1960-05-09',NULL, 'male', 2);



