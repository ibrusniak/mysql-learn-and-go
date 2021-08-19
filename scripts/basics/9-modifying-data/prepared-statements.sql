
-- prepare * from
-- execute * using *
-- deallocate prepare *;

-- prepare random_nums_gen from

prepare gen from
        '
        with recursive generator (a, b, c, d, e, f, counter) as (
            select
                round(rand() * 10000),
                round(rand() * 10000),
                round(rand() * 10000),
                round(rand() * 10000),
                round(rand() * 10000),
                round(rand() * 10000),
                1
            union
            select
                round(rand() * 10000),
                round(rand() * 10000),
                round(rand() * 10000),
                round(rand() * 10000),
                round(rand() * 10000),
                round(rand() * 10000),
                counter + 1
            from
                generator
            where
                counter < ?)
        select a, b, c, d, e, f from generator';


set @row_count = 100;

execute gen using @row_count;

deallocate prepare gen;

