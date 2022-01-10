USE bitrix_79;

SELECT
    concat(b_user.name, " ", b_user.last_name)          AS `Name`,
    b_user.name                                         AS `Given Name`,
    ""                                                  AS `Additional Name`,
    b_user.last_name                                    AS `Family Name`,
    ""                                                  AS `Yomi Name`,
    ""                                                  AS `Given Name Yomi`,
    ""                                                  AS `Additional Name Yomi`,
    ""                                                  AS `Family Name Yomi`,
    ""                                                  AS `Name Prefix`,
    ""                                                  AS `Name Suffix`,
    ""                                                  AS `Initials`,
    b_user.login                                        AS `Nickname`,
    ""                                                  AS `Short Name`,
    ""                                                  AS `Maiden Name`,
    b_user.personal_birthday                            AS `Birthday`,
    ""                                                  AS `Gender`,
    ""                                                  AS `Location`,
    ""                                                  AS `Billing Information`,
    ""                                                  AS `Directory Server`,
    ""                                                  AS `Mileage`,
    ""                                                  AS `Occupation`,
    ""                                                  AS `Hobby`,
    ""                                                  AS `Sensitivity`,
    ""                                                  AS `Priority`,
    ""                                                  AS `Subject`,
    b_user.work_position                                AS `Notes`,
    ""                                                  AS `Language`,
    ""                                                  AS `Photo`,
    "Imported ::: * Prosteer group,"                    AS `Group Membership`,
    "* "                                                AS `E-mail 1 - Type`,
    ifnull(b_user.email, "")                            AS `E-mail 1 - Value`,
    ""                                                  AS `Phone 1 - Type`,
    concat("+38",
        replace(
        replace(
        replace(
        replace(
        replace(
        replace(
        b_user.personal_mobile, " ", ""), "-", ""), "+", ""), ")", ""), "(", ""), "38", "")) AS `Phone 1 - Value`,
    ""                                                  AS `Organization 1 - Type`,
    "ProsteerGroup"                                     AS `Organization 1 - Name`,
    ""                                                  AS `Organization 1 - Yomi Name`,
    ""                                                  AS `Organization 1 - Title`,
    ""                                                  AS `Organization 1 - Department`,
    ""                                                  AS `Organization 1 - Symbol`,
    ""                                                  AS `Organization 1 - Location`,
    ""                                                  AS `Organization 1 - Job Description`
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
    
    