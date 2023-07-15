DELIMITER //

CREATE PROCEDURE `create_new_customer`(name varchar(30), surname varchar(30), age integer)
begin
	if age < 18 then
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'You are not eligible';
    end if;

	insert into kuryer(name, surname, age)
    values (name, surname, age);
    
    select * from kuryer;
end//

DELIMITER ;


call create_new_customer('Jack','Jackson',15);
