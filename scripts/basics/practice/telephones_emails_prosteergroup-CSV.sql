USE bitrix_79;

SELECT 
    "Name,Given Name,Additional Name,Family Name,Yomi Name,Given Name Yomi,Additional Name Yomi,Family Name Yomi,Name Prefix,Name Suffix,Initials,Nickname,Short Name,Maiden Name,Birthday,Gender,Location,Billing Information,Directory Server,Mileage,Occupation,Hobby,Sensitivity,Priority,Subject,Notes,Language,Photo,Group Membership,E-mail 1 - Type,E-mail 1 - Value,Phone 1 - Type,Phone 1 - Value,Organization 1 - Type,Organization 1 - Name,Organization 1 - Yomi Name,Organization 1 - Title,Organization 1 - Department,Organization 1 - Symbol,Organization 1 - Location,Organization 1 - Job Description" AS `CSV_Title`

UNION

SELECT
    concat(
        
        concat(b_user.name, " ", b_user.last_name),
        ",",
        b_user.name,
        ",",
        ",",
        b_user.last_name,
        ",",
        ",,,,,,,,,,,,,,,,,,,,,,,,",
        "Imported ::: * myContacts,",
        "* ,",
        ifnull(b_user.email, ""),
        ",",
        ",",
        concat("+38",
            replace(
            replace(
            replace(
            replace(
            replace(
            replace(
            b_user.personal_mobile, " ", ""), "-", ""), "+", ""), ")", ""), "(", ""), "38", "")),
        ",",
        ",",
        "ProsteerGroup,",
        ",,,,,"
    
    ) AS `CVS_Strings`
    
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
        b_user.personal_mobile, " ", ""), "-", ""), "+", ""), ")", ""), "(", ""), "38", "")) >= 10

LIMIT 2

;
    
    