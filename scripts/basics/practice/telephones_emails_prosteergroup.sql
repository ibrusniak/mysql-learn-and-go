USE bitrix_79;

SELECT
    b_user.name as `Name`,
    b_user.last_name `LastName`,
    ifnull(b_user.email, "") AS `Email`,
    
    
    replace(
    replace(
    replace(
    replace(
    replace(
    replace(
    b_user.personal_mobile, " ", ""), "-", ""), "+", ""), ")", ""), "(", ""), "38", "")
        AS `MobilePhone`
FROM
    b_user
WHERE
    b_user.name regexp("[а-яА-ЯЁёЪъЇї]")
    AND ACTIVE = 'Y'
    AND b_user.personal_mobile IS NOT null
    AND b_user.personal_mobile != ""
    AND 
       length(
        replace(
        replace(
        replace(
        replace(
        replace(
        replace(
        b_user.personal_mobile, " ", ""), "-", ""), "+", ""), ")", ""), "(", ""), "38", "")) >= 10;
    
    