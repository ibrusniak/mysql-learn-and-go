
use classicmodels;

drop procedure if exists customer_chart;
drop procedure if exists show_routines;

delimiter $$

create procedure customer_chart()
begin
        select
            orders.orderNumber,
            customers.customerNumber,
            sum(orderDetails.priceEach * orderDetails.quantityOrdered) orderTotal
        from
            orders
            inner join orderdetails using (orderNumber)
            inner join customers using (customerNumber)
        group by
            orders.orderNumber,
            customers.customerNumber
        order by
            orderTotal desc
        limit
            10;
end$$

create procedure show_routines(in _schema varchar(100))
begin
        select
            created,
            definer,
            specific_name,
            routine_type,
            routine_schema
        from
            information_schema.routines
        where
            routine_schema = _schema;
end$$

delimiter ;

call customer_chart();

set @current_db := database();

call show_routines(@current_db);

drop procedure customer_chart;

call show_routines(@current_db);


